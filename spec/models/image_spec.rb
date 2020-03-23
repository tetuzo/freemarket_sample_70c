require 'rails_helper'
describe Image do
  describe '#create' do

    it "is invalid without a image" do
      image = build(:image, image: "")
      image.valid?
      expect(image.errors[:image]).to include("を入力してください")
    end

    it 'is invalid without item and image' do
      message = build(:image, image: nil, item_id: nil)
    end
  end
end