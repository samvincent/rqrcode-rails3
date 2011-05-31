require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test "truth" do
    assert_kind_of Dummy::Application, Rails.application
  end
  
  test 'svg request returns an SVG file' do
    visit home_path
    click_link 'SVG'
    assert_equal 'image/svg+xml; charset=utf-8', headers['Content-Type']
    assert_equal File.read('test/support/data/qrcode.svg'), page.body
  end

  test 'png request returns an PNG file' do
    visit home_path
    click_link 'PNG'
    assert_equal 'image/png; charset=utf-8', headers['Content-Type']    
    assert_equal File.read('test/support/data/qrcode.png')[0,4], page.body[0,4]
  end
  
  protected
  
  def headers
    page.response_headers
  end
end
