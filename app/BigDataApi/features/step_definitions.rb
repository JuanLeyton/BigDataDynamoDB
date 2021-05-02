Before("@apibigdata") do
  @service = ApiBigData::Resource.new
  @client = @service.client
end

After("@apibigdata") do
  # shared cleanup logic
end
