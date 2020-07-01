require_relative '../../automated_init'

context 'Handle Enquiry Commands' do
  context 'Start Enquiry' do
    context 'Enquiry Started' do
      handler = Handlers::Commands.new
      processed_time = Controls::Time::Processed::Raw.example

      handler.clock.now = processed_time

      start = Controls::Commands::Start.example

      enquiry_id = start.enquiry_id or fail
      effective_time = start.time or fail

      handler.(start)

      writer = handler.write

      started = writer.one_message do |event|
        event.instance_of?(Messages::Events::Started)
      end

      test 'Started event is written' do
        refute(started.nil?)
      end

      test 'Written to enquiry stream' do
        written_to_stream = writer.written?(started) do |stream_name|
          stream_name == "enquiry-#{enquiry_id}"
        end

        assert(written_to_stream)
      end

      context 'Attributes' do
        test 'enquiry_id' do
          assert(started.enquiry_id == enquiry_id)
        end

        test 'time' do
          assert(started.time == effective_time)
        end

        test 'processed_time' do
          processed_time_iso8601 = Clock::UTC.iso8601(processed_time)

          assert(started.processed_time == processed_time_iso8601)
        end
      end
    end
  end
end