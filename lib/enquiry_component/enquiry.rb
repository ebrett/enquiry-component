module EnquiryComponent
  class Enquiry
    include Schema::DataStructure

    attribute :id, String
    attribute :started_time, Time

    def started?
      !started_time.nil?
    end
  end
end
