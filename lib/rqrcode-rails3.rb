require 'action_controller'
require 'rqrcode'
require 'rqrcode-rails3/size_calculator.rb'
require 'rqrcode-rails3/renderers/svg.rb'

module RQRCode
  Mime::Type.register "image/svg+xml", :svg unless Mime::Type.lookup_by_extension(:svg)
  Mime::Type.register "image/png",     :png unless Mime::Type.lookup_by_extension(:png)
	Mime::Type.register "image/jpeg",     :png unless Mime::Type.lookup_by_extension(:jpeg)
  Mime::Type.register "image/gif",     :png unless Mime::Type.lookup_by_extension(:gif)
	
  extend SizeCalculator
  
  ActionController::Renderers.add :qrcode do |string, options|
    format = self.request.format.symbol
    size   = options[:size]  || RQRCode.minimum_qr_size_from_string(string)
    level  = options[:level] || :h
    
    qrcode = RQRCode::QRCode.new(string, :size => size, :level => level)
    svg    = RQRCode::Renderers::SVG::render(qrcode, options)
    
    data = \
    if format && [:png,:jpeg,:gif].include?(format)
      image = MiniMagick::Image.read(svg) { |i| i.format "svg" }
      image.format format
      image.to_blob
    else			
      svg
    end
    
    self.response_body = render_to_string(:text => data, :template => nil)
  end
end
