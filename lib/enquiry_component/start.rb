# Component initiator user guide: http://docs.eventide-project.org/user-guide/component-host.html#component-initiator

module EnquiryComponent
  module Start
    def self.call
      Consumers::Commands.start('enquiry:command')
      Consumers::Events.start('enquiry')
    end
  end
end
