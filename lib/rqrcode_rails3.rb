require "action_controller"
require 'rqrcode'
require 'rqrcode_rails3/svg_renderer'

module RQRCode
  module SVG
    Mime::Type.register "image/svg+xml", :svg
    
    ActionController::Renderers.add :svg do |string, options|      
      qrcode = RQRCode::QRCode.new(string)
      svg = RQRCode::Renderers::SVG::render(qrcode)
      self.response_body = render_to_string(:text => svg, :template => nil)
    end
  end
end