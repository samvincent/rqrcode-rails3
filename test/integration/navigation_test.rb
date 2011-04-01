require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test "truth" do
    assert_kind_of Dummy::Application, Rails.application
  end
  
  test 'pdf request sends a pdf as file' do
    visit home_path
    click_link 'SVG'
    assert_equal 'image/svg+xml; charset=utf-8', headers['Content-Type']
    # assert_match /Prawn/, page.body
  end
  
  protected
  
  def headers
    page.response_headers
  end
end
