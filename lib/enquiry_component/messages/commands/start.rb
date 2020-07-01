module EnquiryComponent
  module Messages
    module Commands
      class Start
        include Messaging::Message

        attribute :enquiry_id, String
        attribute :time, String
      end
    end
  end
end
