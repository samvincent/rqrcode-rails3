module RQRCode
  module Renderers
    class SVG
      class << self
        def render(qrcode, options={})
          # Padding around the qrcode 
          offset = options[:offset] || 0

          # Dark color
          light = options[:fill] || "fff"
          # Light color
          dark = options[:color] || "000"

          # height and width dependent on offset and QR complexity
          dimension = (qrcode.module_count*11) + (2*offset)

          xml_tag   = %{<?xml version="1.0" standalone="yes"?>}
          open_tag  = %{<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ev="http://www.w3.org/2001/xml-events" width="#{dimension}" height="#{dimension}">}
          close_tag = "</svg>"

          result = []
          qrcode.modules.each_index do |c|
            tmp = []
            qrcode.modules.each_index do |r|
              y = c*11 + offset
              x = r*11 + offset

              next unless qrcode.is_dark(c, r) || options[:fill]

              color = qrcode.is_dark(c, r) ? dark : light
              tmp << %{<rect width="11" height="11" x="#{x}" y="#{y}" style="fill:##{color}"/>}
            end 
            result << tmp.join
          end
          svg = [xml_tag, open_tag, result, close_tag].flatten.join("\n")
        end
      end
    end
  end
end
