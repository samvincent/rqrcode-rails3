module RQRCode
  module SVG
    require "action_controller"
    Mime::Type.register "image/svg+xml", :svg
    
    require 'rqrcode'
    ActionController::Renderers.add :svg do |string, options|      
      qrcode = RQRCode::QRCode.new(string)
    
    
      offset = 20
      
      dimension = (qrcode.module_count*11) + (2*offset)
      
      head = <<-XML
<?xml version="1.0" standalone="yes"?>
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:ev="http://www.w3.org/2001/xml-events" width="#{dimension}" height="#{dimension}">
      XML
      
      res = []
      qrcode.modules.each_index do |c|
        tmp = []
        qrcode.modules.each_index do |r|
          y = c*11 + offset
          x = r*11 + offset
          row = %{<rect width="11" height="11" x="#{x}" y="#{y}" style="fill:#000"/>}
          col = %{<rect width="11" height="11" x="#{x}" y="#{y}" style="fill:#fff"/>}
          if qrcode.is_dark(c,r)
            tmp << row 
          else
            tmp << col 
          end
        end 
        res << tmp.join
      end
    
      svg = (head + res.join("") + "</svg>")
      self.response_body = render_to_string(:text => svg, :template => nil)
    end
  end
end