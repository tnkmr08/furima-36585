require 'rails_helper'

RSpec.describe OrderShip, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
    @item.save
    @order_ship = FactoryBot.build(:order_ship, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end
  
  describe '商品購入' do
    context '商品を購入できる時' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_ship).to be_valid
      end  

      it 'buildingが空でも保存できる' do
        @order_ship.building = ''
        expect(@order_ship).to be_valid
      end
    end  

    context '商品を購入できない時' do
      it 'postcodeが空では保存できない' do
        @order_ship.postcode = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Postcode can't be blank")
      end  

      it 'postcodeが半角ハイフンを含んだ正しい形でなければ保存できない' do
        @order_ship.postcode = '1110000'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end  

      it 'prefecture_idが空では保存できない' do
        @order_ship.prefecture_id = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では保存できない' do
        @order_ship.city = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では保存できない' do
        @order_ship.block = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Block can't be blank")
      end

      it 'telephone_numberが空では保存できない' do
        @order_ship.telephone_number = ''
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが正しく入力されていなければ保存できない' do
        @order_ship.telephone_number = '111-2222-3333'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'telephone_numberが半角でなければ保存できない' do
        @order_ship.telephone_number = '０００１１１１２２２２'
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'userが紐付いていないと保存できない' do
        @order_ship.user_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できない' do
        @order_ship.item_id = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できない' do
        @order_ship.token = nil
        @order_ship.valid?
        expect(@order_ship.errors.full_messages).to include("Token can't be blank")
      end
      

    end  
  end
end
