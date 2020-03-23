require 'rails_helper'
describe Item do
  describe '#create' do
    context 'can not save' do
      it "is invalid without a name" do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it "is invalid without a discription" do
        item = build(:item, discription: "")
        item.valid?
        expect(item.errors[:discription]).to include("を入力してください")
      end

      it "is invalid without a status_id" do
        item = build(:item, status_id: "")
        item.valid?
        expect(item.errors[:status_id]).to include("を入力してください")
      end

      it "is invalid without a price" do
        item = build(:item, price: "")
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it "is invalid without a shipping_charges_id" do
        item = build(:item, shipping_charges_id: "")
        item.valid?
        expect(item.errors[:shipping_charges_id]).to include("を入力してください")
      end

      it "is invalid without a shipping_days_id" do
        item = build(:item, shipping_days_id: "")
        item.valid?
        expect(item.errors[:shipping_days_id]).to include("を入力してください")
      end

      it "is invalid without a category_id" do
        item = build(:item, category_id: "")
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
      end

      it "is invalid without a prefecture_id" do
        item = build(:item, prefecture_id: "")
        item.valid?
        expect(item.errors[:prefecture_id]).to include("を入力してください")
      end

      
      it "is invalid with a name that has less than 40 characters " do
        item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        item.valid?
        expect(item.errors[:name]).to include("は40文字以内で入力してください")
      end

      it "is invalid with a discription that has less than 1000 characters " do
        item = build(:item, discription: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
        item.valid?
        expect(item.errors[:discription]).to include("は1000文字以内で入力してください")
      end

      it "is invalid with a price more than 300" do
        item = build(:item, price: "299")
        item.valid?
        expect(item.errors[:price]).to include("は300以上の値にしてください")
      end

      it "is invalid with a price less than 10000000" do
        item = build(:item, price: "10000000")
        item.valid?
        expect(item.errors[:price]).to include("は10000000より小さい値にしてください")
      end

      
    end

    context 'can save' do
      it 'is valid with item no brand_id' do
        expect(build(:item, brand_id: nil)).to be_valid
      end

      it "is valid with a name, all_data" do
        item = build(:item)
        expect(item).to be_valid
      end
    end

  end
end

