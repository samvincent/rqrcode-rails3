class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.svg  { render options }
      format.png  { render options }
      format.jpeg { render options }
      format.gif  { render options }
    end
  end

  private

  def options
    {:qrcode => "http://helloworld.com", :size => 4}
  end
end
