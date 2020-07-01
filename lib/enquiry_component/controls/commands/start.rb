module EnquiryComponent
  module Controls
    module Commands
      module Start
        def self.example
          start = EnquiryComponent::Messages::Commands::Start.build

          start.enquiry_id = Enquiry.id
          start.time = Controls::Time::Effective.example

          start
        end
      end
    end
  end
end
