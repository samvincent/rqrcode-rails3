require "action_controller"
require 'rqrcode'
require 'rqrcode_rails3/svg_renderer'

module RQRCode
  Mime::Type.register "image/svg+xml", :svg
  Mime::Type.register "image/png",     :png
  
  ActionController::Renderers.add :qrcode do |string, options|
    qrcode = RQRCode::QRCode.new(string)
    svg = RQRCode::Renderers::SVG::render(qrcode)
    self.response_body = render_to_string(:text => svg, :template => nil)
  end
end