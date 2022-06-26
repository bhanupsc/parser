# frozen_string_literal: true

require_relative 'ruby_app/version'
require_relative 'ruby_app/file_reader'
require_relative 'ruby_app/entry'
require_relative 'ruby_app/tokenizer'
require_relative 'ruby_app/accumulator'
require_relative 'ruby_app/aggregator'
require_relative 'ruby_app/aggregator_result'
require_relative 'ruby_app/formatter'
require_relative 'ruby_app/parser'

module RubyApp
  class Error < StandardError; end
end
