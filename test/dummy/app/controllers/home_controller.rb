class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.svg { render :svg => "http://www.helloworld.com" }
    end
  end
end