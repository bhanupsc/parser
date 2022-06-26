# frozen_string_literal: true

RSpec.describe RubyApp::Tokenizer do
  let(:tokenizer) { described_class.new(lines) }
  let(:lines) do
    [
      '/about-us 191.14.205.179',
      '/features 214.236.57.207'
    ]
  end

  describe '#entries' do
    subject { tokenizer.entries.to_a }

    let(:expected_entries) do
      [
        RubyApp::Entry.new('/about-us', '191.14.205.179'),
        RubyApp::Entry.new('/features', '214.236.57.207')
      ]
    end

    it { is_expected.to eql(expected_entries) }
  end
end
