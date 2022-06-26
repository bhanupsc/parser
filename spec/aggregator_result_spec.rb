# frozen_string_literal: true

RSpec.describe RubyApp::AggregatorResult do
  let(:result) { described_class[grouped_entries] }
  let(:grouped_entries) do
    {
      '/about' => accumulator1,
      '/home' => accumulator2,
      '/contact-us' => accumulator3
    }
  end
  let(:accumulator1) { instance_double(RubyApp::Accumulator, unique: 5, total: 5) }
  let(:accumulator2) { instance_double(RubyApp::Accumulator, unique: 10, total: 25) }
  let(:accumulator3) { instance_double(RubyApp::Accumulator, unique: 2, total: 150) }

  describe '#sort_by_total' do
    subject { result.sort_by_total }

    let(:expected_sorted_entries) do
      [
        ['/contact-us', accumulator3],
        ['/home', accumulator2],
        ['/about', accumulator1]
      ]
    end

    it { is_expected.to eql(expected_sorted_entries) }
  end

  describe '#sort_by_unique' do
    subject { result.sort_by_unique }

    let(:expected_sorted_entries) do
      [
        ['/home', accumulator2],
        ['/about', accumulator1],
        ['/contact-us', accumulator3]
      ]
    end

    it { is_expected.to eql(expected_sorted_entries) }
  end
end
