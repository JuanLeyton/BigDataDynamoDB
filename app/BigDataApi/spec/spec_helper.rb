require_relative '../../aws-sdk-core/spec/shared_spec_helper'

$:.unshift(File.expand_path('../../lib', __FILE__))
$:.unshift(File.expand_path('../../../aws-sdk-core/lib', __FILE__))
$:.unshift(File.expand_path('../../../aws-sigv4/lib', __FILE__))

require 'rspec'
require 'webmock/rspec'
require 'apibigdata-sdk'
