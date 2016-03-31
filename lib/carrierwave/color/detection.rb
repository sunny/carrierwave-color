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
        histogram = Colorscore::Histogram.new(path)
        palette = Colorscore::Palette.from_hex(palette_hexes)

        histogram_scores = histogram.scores
        return nil if histogram_scores.first.last.nil?

        scores = palette.scores(histogram_scores, 1)
        _score, color = scores.first
        color.html
      end
    end
  end
end
