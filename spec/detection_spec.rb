require "spec_helper"

module CarrierWave
  module Color
    RSpec.describe Detection do
      let(:path) { File.expand_path('../fixtures/red-rainbow.jpg', __FILE__) }

      describe ".dominant_html" do
        it "returns the correct hex code" do
          expect(Detection.dominant_html(path)).to eq("#700503")
        end
      end

      describe ".dominant_from_palette_html" do
        it "returns the correct hex code" do
          palette = %w(ff0000 00ff00 0000ff)
          result = Detection.dominant_from_palette_html(path, palette)
          expect(result).to eq("#ff0000")
        end

        it "returns nil when the histogram fails" do
          allow_any_instance_of(Colorscore::Histogram).to receive(:scores)
            .and_return([[1, nil]])

          palette = %w(ff0000 00ff00 0000ff)
          result = Detection.dominant_from_palette_html(path, palette)
          expect(result).to be_nil
        end
      end
    end
  end
end
