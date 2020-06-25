ENV['CONSOLE_DEVICE'] ||= 'stdout'
ENV['LOG_LEVEL'] ||= '_min'

puts RUBY_DESCRIPTION
puts

require_relative '../init.rb'

require 'test_bench'; TestBench.activate

require 'pp'

require 'enquiry_component/controls'

include EnquiryComponent
