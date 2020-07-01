module EnquiryComponent
  module Messages
    module Events
      class Started
        include Messaging::Message

        attribute :enquiry_id, String
        attribute :time, String
        attribute :processed_time, String
      end
    end
  end
end
