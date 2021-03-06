require 'nokogiri'

module DragonflySvg
  module Processors
    class RemoveNamespaces
      def call(content)
        raise UnsupportedFormat unless content.ext
        raise UnsupportedFormat unless SUPPORTED_FORMATS.include?(content.ext.downcase)

        doc = Nokogiri::XML(content.data)
        doc.remove_namespaces!
        content.update(doc.to_xml, 'name' => 'temp.svg')
      end
    end
  end
end
