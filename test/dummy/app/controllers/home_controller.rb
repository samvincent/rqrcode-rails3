class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.svg { render :qrcode => "http://helloworld.com" }
      format.png { render :qrcode => "http://helloworld.com" }
    end
  end
end