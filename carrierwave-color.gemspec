lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'carrierwave/color/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-color"
  spec.version       = CarrierWave::Color::VERSION
  spec.authors       = ["Sunny Ripert"]
  spec.email         = ["sunny@sunfox.org"]
  spec.summary       = "Store the dominant color of an image with CarrierWave"
  spec.description   = "Store the dominant color of the images when you " \
                       "upload them to your Rails application using the " \
                       "CarrierWave gem."
  spec.homepage      = "https://github.com/sunny/carrierwave-color"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "colorscore"
end
