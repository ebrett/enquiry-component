module EnquiryComponent
  module Controls
    module Enquiry
      def self.example
        enquiry = EnquiryComponent::Enquiry.build

        enquiry.id = id
        enquiry.started_time = Time::Effective::Raw.example

        enquiry
      end

      def self.id
        ID.example(increment: id_increment)
      end

      def self.id_increment
        1111
      end

      module New
        def self.example
          EnquiryComponent::Enquiry.build
        end
      end

      module Start
        def self.example
          Enquiry.example
        end
      end

      module Identified
        def self.example
          enquiry = New.example
          enquiry.id = Enquiry.id
          enquiry
        end
      end
    end
  end
end
