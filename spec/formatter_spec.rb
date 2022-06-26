# frozen_string_literal: true

RSpec.describe RubyApp::Formatter do
  let(:formatter) { described_class.new(aggregator_result) }
  let(:aggregator_result) do
    RubyApp::AggregatorResult[
      '/about' => instance_double(RubyApp::Accumulator, unique: 5, total: 100),
      '/home' => instance_double(RubyApp::Accumulator, unique: 10, total: 25),
      '/contact-us' => instance_double(RubyApp::Accumulator, unique: 2, total: 140)
    ]
  end

  describe '#format' do
    subject { formatter.format }

    let(:expected_output) do
      <<~EOF
        Entries by total views:
        /contact-us 140 visits
        /about 100 visits
        /home 25 visits

        Entries by unique views:
        /home 10 unique visits
        /about 5 unique visits
        /contact-us 2 unique visits
      EOF
    end

    it { is_expected.to eql(expected_output) }
  end
end
