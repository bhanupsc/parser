# frozen_string_literal: true

module RubyApp
  class Formatter
    def initialize(aggregator_result)
      @aggregator_result = aggregator_result
    end

    def format
      <<~EOF
        Page views:
        #{total_views}

        Unique views:
        #{unique_views}
      EOF
    end

    private

    def total_views
      @aggregator_result.sort_by_total.map do |path, accumulator|
        "#{path} #{accumulator.total} has visits"
      end.join("\n")
    end

    def unique_views
      @aggregator_result.sort_by_unique.map do |path, accumulator|
        "#{path} has #{accumulator.unique} unique visits"
      end.join("\n")
    end
  end
end
