require "action_controller"
require 'rqrcode'
require 'rqrcode_rails3/renderers/*.rb'

module RQRCode
  Mime::Type.register "image/svg+xml", :svg
  Mime::Type.register "image/png",     :png
  
  ActionController::Renderers.add :qrcode do |string, options|
    format = self.request.format.symbol
    
    qrcode = RQRCode::QRCode.new(string)
    svg = RQRCode::Renderers::SVG::render(qrcode)
    
    if format == :png
      # Need to convert svg to png with mini magic
      path = File.join(File.dirname(__FILE__), '../test/support/data/qrcode.png')
      png = File.read path
      
      content_data = png
    else
      content_data = svg
    end
    
    self.response_body = render_to_string(:text => content_data, :template => nil)
  end
end