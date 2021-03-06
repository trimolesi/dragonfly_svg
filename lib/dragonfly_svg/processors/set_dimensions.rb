require 'nokogiri'

module DragonflySvg
  module Processors
    class SetDimensions
      def call(content, width, height)
        raise UnsupportedFormat unless content.ext
        raise UnsupportedFormat unless SUPPORTED_FORMATS.include?(content.ext.downcase)

        SetAttribute.new.call(content, "//*[name()='svg']", 'width', width) if width
        SetAttribute.new.call(content, "//*[name()='svg']", 'height', height) if height
      end
    end
  end
end
