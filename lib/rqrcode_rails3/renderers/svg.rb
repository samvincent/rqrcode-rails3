module RQRCode
  module Renderers
    class SVG
      class << self
        def render(qrcode, options={})
          # Padding around the qrcode 
          offset = options[:offset] || 0

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
              row = %{<rect width="11" height="11" x="#{x}" y="#{y}" style="fill:#000"/>}
              col = options[:fill] ? %{<rect width="11" height="11" x="#{x}" y="#{y}" style="fill:#fff"/>} : ""
              if qrcode.is_dark(c,r)
                tmp << row 
              else
                tmp << col 
              end
            end 
            result << tmp.join
          end
          svg = [xml_tag, open_tag, result, close_tag].flatten.join("\n")
        end
      end
    end
  end
end
