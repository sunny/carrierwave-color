require "colorscore"

module CarrierWave
  module Color
    module Detection
      module_function

      def dominant_html(path)
        histogram = Colorscore::Histogram.new(path, 1)
        color = histogram.colors.first
        color && color.html
      end

      def dominant_from_palette_html(path, palette_hexes)
        scores = Colorscore::Histogram.new(path).scores
        palette = Colorscore::Palette.from_hex(palette_hexes)

        # Return nil values from scores
        scores.reject! { |_color_score, color| color.nil? }
        return nil if scores.empty?

        scores = palette.scores(scores, 1)
        _score, color = scores.first
        color.html
      end
    end
  end
end
