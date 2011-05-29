module RQRCode
  module Renderers
    class SVG
      class << self
        # Render the SVG from the qrcode string provided from the RQRCode gem
        #   Options:
        #   offset - Padding around the QrCode e.g. 10
        #   fill   - Background color e.g "ffffff"
        #   color  - Foreground color for the code e.g. "000000"
        #   blank_padding - Only used when using offset and fill options, set to true to leave the padding a blank color. Default is false

        def render(qrcode, options={})
          offset  = options[:offset].to_i || 0
          light   = options[:fill]        || "fff"
          dark    = options[:color]       || "000"

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

          # Color background squares as well
          if options[:offset] && options[:fill] && !options[:blank_padding]
            result << %{<rect width="#{offset}" height="#{dimension}" x="0" y="0" style="fill:##{light}"/>}
            result << %{<rect width="#{offset}" height="#{dimension}" x="#{dimension-offset}" y="0" style="fill:##{light}"/>}
            result << %{<rect width="#{dimension-2*offset}" height="#{offset}" x="#{offset}" y="0" style="fill:##{light}"/>}
            result << %{<rect width="#{dimension-2*offset}" height="#{offset}" x="#{offset}" y="#{dimension-offset}" style="fill:##{light}"/>}
          end

          svg = [xml_tag, open_tag, result, close_tag].flatten.join("\n")
        end
      end
    end
  end
end
