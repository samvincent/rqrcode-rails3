module RQRCode
  module SizeCalculator
    # size - seems to follow this logic
    #     # | input | modules 
    #       | size  | created
    #-------|-------|--------
    #     1 |     7 |      21
    #     2 |    14 |      25 (+4)
    #     3 |    24 |      29   -
    #     4 |    34 |      33   -
    #     5 |    44 |      37   -
    #     6 |    58 |      41   -
    #     7 |    64 |      45   -
    #     8 |    84 |      49   -
    #     9 |    98 |      53   -
    #    10 |   119 |      57   -
    #    11 |   137 |      61   -
    #    12 |   155 |      65   -
    #    13 |   177 |      69   -
    #    14 |   194 |      73   -
    
    QR_CHAR_SIZE_VS_SIZE = [7, 14, 24, 34, 44, 58, 64, 84, 98, 119, 137, 155, 177, 194]
    
    def minimum_qr_size_from_string(string)
      QR_CHAR_SIZE_VS_SIZE.each_with_index do |size, index|
        return (index + 1) if string.size < size
      end
      
      # If it's particularly big, we'll try and create codes until it accepts
      i = QR_CHAR_SIZE_VS_SIZE.size
      begin
        i += 1
        RQRCode::QRCode.new(string, :size => i)
        return i
      rescue RQRCode::QRCodeRunTimeError
        retry
      end
    end
  end
end