require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @order_shipping = FactoryBot.build(:order_shipping)
  end

  describe '配送先情報' do
    context '配送先情報が保存できる場合' do
      it 'ユーザーID、商品ID、郵便番号、都道府県、市区町村名、番地、電話番号、トークンが存在すれば保存できる' do
        expect(@order_shipping).to be_valid
      end

      it "建物の名前は空白でも保存できる" do
        @order_shipping.building = nil
        expect(@order_shipping).to be_valid
      end
    end

    context '配送先情報を保存できない場合' do
      it "ユーザーIDが空白だと保存できない" do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end

      it "商品IDが空白だと保存できない" do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it "郵便番号が空白だと保存できない" do
        @order_shipping.postal_code = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end

      it "郵便番号にハイフンがないと保存できない" do
        @order_shipping.postal_code = 1112222
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "都道府県が未入力だと保存できない" do
        @order_shipping.region_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Region can't be blank")
      end

      it "市区町村名が空白だと保存できない" do
        @order_shipping.city = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it "番地が空白だと保存できない" do
        @order_shipping.block = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Block can't be blank")
      end

      it "電話番号が空白だと保存できない" do
        @order_shipping.phone_number = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it "電話番号にハイフンが含まれていると保存できない" do
        @order_shipping.phone_number = 111-1111-1111
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が9文字以下だと保存できない" do
        @order_shipping.phone_number = 1112
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が12文字以上だと保存できない" do
        @order_shipping.phone_number = 1112111211122222
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number is invalid")
      end

      it "トークンが空白だと保存できない" do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
