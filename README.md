# Render QR codes easily from your Rails 3 application

This gem supports rendering either SVG or PNG, JPEG, and GIF formats.

SVG, because of it's vector nature, will scale easily when intended for print. Offering QR endpoints enables others to integrate with your service in possibly interesting ways.

## Installation

Add the following to your `Gemfile`.

    gem 'rqrcode-rails3'

If you want to use the PNG, JPEG or GIF format, you will have to have **ImageMagick** installed on your system.
You will also want to add the **mini_magick** gem to your application's `Gemfile`.

    gem 'mini_magick'

## How to use

In your controller actions, you could return a QR code that links to the current page like this:

```ruby
respond_to do |format|
  format.html
  format.svg  { render :qrcode => request.url, :level => :l, :unit => 10 }
  format.png  { render :qrcode => request.url }
  format.gif  { render :qrcode => request.url }
  format.jpeg { render :qrcode => request.url }
end
```
  
#### Options:

* `:size`   – This controls how big the QR Code will be. Smallest size will be chosen by default. Set to maintain consistent size.
* `:level`  – The error correction level, can be:
  * Level `:l` 7%  of code can be restored
  * Level `:m` 15% of code can be restored
  * Level `:q` 25% of code can be restored
  * Level `:h` 30% of code can be restored (default :h) 
* `:offset` – Padding around the QR Code (e.g. 10)
* `:unit`   – How many pixels per module (e.g. 11)
* `:fill`   – Background color (e.g "ffffff" or :white)
* `:color`  – Foreground color for the code (e.g. "000000" or :black)
  
## About

This project was inspired by the first chapter in José Valim's book [Crafting Rails Applications](http://pragprog.com/titles/jvrails/crafting-rails-applications)

QR codes are encoded by [rqrcode](https://github.com/whomwah/rqrcode)