require "carrierwave/color/detection"

module CarrierWave
  module Color
    def store_dominant_color
      color = Detection.dominant_html(current_path)
      model.send "#{mounted_as}_dominant_color=", color
    end

    def store_palette_color(palette = Colorscore::Palette::DEFAULT)
      color = Detection.dominant_from_palette_html(current_path, palette)
      model.send "#{mounted_as}_palette_color=", color
    end
  end
end
