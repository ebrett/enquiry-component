# Handler user guide: http://docs.eventide-project.org/user-guide/handlers.html
# Message user guide: http://docs.eventide-project.org/user-guide/messages-and-message-data/

module EnquiryComponent
  module Handlers
    class Events
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      # include Messages::Events once events are implemented
      # include Messages::Events

      # Note: Delete this file if not handling events

      # TODO Implement event handler blocks
      # eg:
      # handle SomethingHappened do |something_happened|
      # end
    end
  end
end
