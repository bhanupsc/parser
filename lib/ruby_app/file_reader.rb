# frozen_string_literal: true

module RubyApp
  class FileReader
    def initialize(path)
      @path = path
    end

    def lines
      handle.each.map(&:chomp)
    end

    private

    def handle
      File.open(@path, 'r')
    rescue Errno::ENOENT, Errno::EACCESS => e
      raise RubyApp::Error, e.message
    end
  end
end
