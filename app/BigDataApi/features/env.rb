$:.unshift(File.expand_path('../../lib', __FILE__))
$:.unshift(File.expand_path('../../../aws-sdk-core/features', __FILE__))
$:.unshift(File.expand_path('../../../aws-sdk-core/lib', __FILE__))
$:.unshift(File.expand_path('../../../aws-sigv4/lib', __FILE__))

require 'features_helper'
require 'apibigdata-sdk'

ApiBigData::Client.add_plugin(ApiCallTracker)
