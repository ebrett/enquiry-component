require_relative '../../automated_init'

context 'Handle Commands' do
  context 'Start' do
    context 'Ignored' do
      handler = Handlers::Commands.new

      start = Controls::Commands::Start.example

      enquiry = Controls::Enquiry::Start.example

      handler.store.add(enquiry.id, enquiry)

      handler.(start)

      writer = handler.write

      started = writer.one_message do |event|
        event.instance_of?(Messages::Events::Started)
      end

      test 'Started event is not written' do
        assert(started.nil?)
      end
    end
  end
end