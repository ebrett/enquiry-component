require 'eventide/postgres'

# TODO Load command and event message files"
# require 'enquiry_component/messages/commands/...'
# require 'enquiry_component/messages/events/...'

require 'enquiry_component/enquiry'
require 'enquiry_component/projection'
require 'enquiry_component/store'

require 'enquiry_component/handlers/commands'
require 'enquiry_component/handlers/events'

require 'enquiry_component/consumers/commands'
require 'enquiry_component/consumers/events'

require 'enquiry_component/start'
