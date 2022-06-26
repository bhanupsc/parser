# frozen_string_literal: true

module RubyApp
  class Accumulator
    attr_accessor :total, :unique, :ips

    def initialize
      @total = 0
      @unique = 0
      @ips = {}
    end

    def add(entry)
      self.total += 1
      return nil if ips[entry.ip]
      
      self.unique += 1
      ips[entry.ip] = true
    end
  end
end
