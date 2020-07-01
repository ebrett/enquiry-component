require_relative '../automated_init'

context 'Enquiry' do
  context 'Has started time' do
    enquiry = Controls::Enquiry::Start.example

    test 'Is open' do
      assert(enquiry.started?)
    end
  end

  context 'Does not have start time' do
    enquiry = Controls::Enquiry::New.example

    test 'Is not started' do
      refute(enquiry.started?)
    end
  end
end