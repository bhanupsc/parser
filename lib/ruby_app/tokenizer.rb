# frozen_string_literal: true

module RubyApp
  class Tokenizer
    def initialize(lines)
      @lines = lines
    end

    def entries
      @lines.lazy.map do |line|
        Entry.new(*line.split)
      end
    end
  end
end
