# Handler user guide: http://docs.eventide-project.org/user-guide/handlers.html
# Message user guide: http://docs.eventide-project.org/user-guide/messages-and-message-data/

module EnquiryComponent
  module Handlers
    class Commands
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency
      include Messages::Events
      include Messages::Commands

      dependency :write, Messaging::Postgres::Write
      dependency :clock, Clock::UTC
      dependency :store, Store

      def configure
        Messaging::Postgres::Write.configure(self)
        Clock::UTC.configure(self)
        Store.configure(self)
      end

      category :enquiry

      handle Start do |start|
        enquiry_id = start.enquiry_id

        enquiry, version = store.fetch(enquiry_id, include: :version)

        if enquiry.started?
          logger.info(tag: :ignored) { "Command ignored #{start.message_type}, Enquiry ID: #{enquiry_id}" }
          return
        end

        time = clock.iso8601

        started = Started.follow(start)
        started.processed_time = time

        stream_name = stream_name(enquiry_id)

        write.(started, stream_name, expected_version: version)
      end
    end
  end
end
