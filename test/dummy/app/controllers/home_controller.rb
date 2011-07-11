class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.svg { render :qrcode => "http://helloworld.com", :size => 4 }
      format.png { render :qrcode => "http://helloworld.com", :size => 4 }
    end
  end
end