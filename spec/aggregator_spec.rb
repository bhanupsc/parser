# frozen_string_literal: true

RSpec.describe RubyApp::Aggregator do
  let(:aggregator) { described_class.new(entries) }
  let(:entries) do
    [
      RubyApp::Entry.new('/about', '1.2.2.2'),
      RubyApp::Entry.new('/about', '1.2.2.2'),
      RubyApp::Entry.new('/about', '2.2.2.2'),
      RubyApp::Entry.new('/home', '1.2.2.2'),
      RubyApp::Entry.new('/home', '1.2.2.2')
    ]
  end

  describe '#group' do
    subject(:group) { aggregator.group }

    it 'group entries by their path' do
      expect(group.keys).to match_array(['/home', '/about'])
    end

    it 'stores total views' do
      expect(group.fetch('/about').total).to eql(3)
    end
  end
end
