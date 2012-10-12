require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test "truth" do
    assert_kind_of Dummy::Application, Rails.application
  end
  
  test 'svg request returns a SVG file' do
    visit home_path
    click_link 'SVG'
    assert_equal 'image/svg+xml; charset=utf-8', headers['Content-Type']
    assert_equal File.read('test/support/data/qrcode.svg'), page.source
  end
	
  test 'png request returns a PNG file' do
		image_test('png')
  end

  test 'jpeg request returns a JPEG file' do
		image_test('jpeg')
  end

  test 'gif request returns a GIF file' do
		image_test('gif')
  end
  
  protected
  
  def headers
    page.response_headers
  end
	
	def image_test(format)
    visit home_path
    click_link format.upcase
    assert_equal "image/#{format}; charset=utf-8", headers['Content-Type']    
    assert_equal File.read("test/support/data/qrcode.#{format}")[0,4], page.source.force_encoding("UTF-8")[0,4]
	end	
end
