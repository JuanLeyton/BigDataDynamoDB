# ApiBigData

This is the Version 1 of the apibigdata-sdk gem.

## WARNING

Please read through this `README.md` and `apibigdata-sdk.gemspec` then tailor it with your gem needs before serving it for any official usage or gem publishing. If you have any questions, issue or feature requests for this generated gem, feel free to open an issue or PR againt [`AWS SDK for Ruby`](https://github.com/aws/aws-sdk-ruby)

## API Client

Initialize a service client and list all operations available.

```ruby
require 'apibigdata-sdk'

client = ApiBigData::Client.new

puts client.operation_names
```

For each operation usage example, see `lib/client.rb` documentation block per operation

## Authorizer

For operations used custom authorizer, you can provide your own authorizer token logic at `lib/plugins/authorizer.rb` under method `generate_token`. For more information, please see [here](http://docs.aws.amazon.com/apigateway/latest/developerguide/use-custom-authorizer.html).

## AWS Credentials

For those API requets that are authenticated with AWS Credentials (e.g. IAM roles), you would need to configure `:credentials` and `:region` that helps sigining request with [AWS Signature V4](http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html). You can also provide those information via your environment:

The SDK searches the following locations for credentials:

* `ENV['AWS_ACCESS_KEY_ID']` and `ENV['AWS_SECRET_ACCESS_KEY']`
* Unless `ENV['AWS_SDK_CONFIG_OPT_OUT']` is set, the shared configuration files (`~/.aws/credentials` and `~/.aws/config`) will be checked for a `role_arn` and `source_profile`, which if present will be used to attempt to assume a role.
* The shared credentials ini file at `~/.aws/credentials` ([more information](http://blogs.aws.amazon.com/security/post/Tx3D6U6WSFGOK2H/A-New-and-Standardized-Way-to-Manage-Credentials-in-the-AWS-SDKs))
* Unless `ENV['AWS_SDK_CONFIG_OPT_OUT']` is set, the shared configuration ini file at `~/.aws/config` will also be parsed for credentials.
* From an instance profile when running on EC2, or from the ECS credential provider when running in an ECS container with that feature enabled.

The SDK searches the following locations for a region:

* `ENV['AWS_REGION']`
* Unless `ENV['AWS_SDK_CONFIG_OPT_OUT']` is set, the shared configuration files (`~/.aws/credentials` and `~/.aws/config`) will also be checked for a region selection.

Valid region and credentials options are:

* `:region` - A string like `us-west-2`.
* `:credentials` - An instance of one of the following classes:
* [`Aws::Credentials`](http://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Credentials.html)
* [`Aws::SharedCredentials`](http://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/SharedCredentials.html)
* [`Aws::InstanceProfileCredentials`](http://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/InstanceProfileCredentials.html)
* [`Aws::AssumeRoleCredentials`](http://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/AssumeRoleCredentials.html)

## API Key

Simply provide an `:api_key` value when calling an API along with other params, this value will be picked up in the `x-api-key` header value.

## License

DEFAULT: This library is distributed under the
[Apache License, version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

Feel free to change your license specification here and at `apibigdata-sdk.gemspec`
