class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    path = BASE_URL + "/users"

    RestClient.post(path, {
        :Email => user_params[:email],
        :Name_User => user_params[:first_name],
        :Last_Name_User => user_params[:last_name],
        :Password => user_params[:password]
      }.to_json,
      {Authorization: CREDENTIALS}
    ) { |response, request, result, &block|
      case response.code
        when 200
          redirect_to :root
          jsonResponse = JSON.parse(response)
          puts response
        else
            flash[:signin_errors] = "Se presentó un error al intentar crear el usuario."
            render action: "index"
      end
    }
  end

  def update    
    path = BASE_URL + "/users"

    token = generate_token

    RestClient.patch(path, {
      :Email => user_params[:email],
      :Password => user_params[:password],
      :Token_Session => token
    }.to_json,
    {Authorization: CREDENTIALS}
    ) { |response, request, result, &block|
    puts response
      case response.code
        when 200
          session[:user_id] = token
          redirect_to controller: "users", action: "index"
        else
          flash[:signin_errors] = "El usuario o la contraseña es incorrecta."
          redirect_to :root
      end
    }
  end

  private

  def generate_token
      SecureRandom.hex(20)
  end

  def user_params
      params.permit(:email, :first_name, :last_name, :password)
  end
end
