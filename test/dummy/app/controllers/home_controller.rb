class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.svg { render :qrcode => "http://helloworld.com", :format => :svg }
      format.png { render :qrcode => "http://helloworld.com", :format => :png }
    end
  end
end