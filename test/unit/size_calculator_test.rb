require 'test_helper'

class RQRCode::SizeCalculatorTest < ActiveSupport::TestCase
  include RQRCode::SizeCalculator
  
  test "size returned is 1 for 'apple'" do
    assert_equal(1, minimum_qr_size_from_string('apple'))
  end
  
  test "size returned is 5 for 'http://guides.rubyonrails.org/testing.html'" do
    assert_equal(5, minimum_qr_size_from_string('http://guides.rubyonrails.org/testing.html'))
  end
  
  test "size returned is 18 for long long string" do
    assert_equal(18, minimum_qr_size_from_string('a'*300))
  end
end
