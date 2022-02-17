require 'rails_helper'

RSpec.describe OrderSend, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @ordersend = FactoryBot.build(:order_send, user_id: user.id, item_id: item.id)
    sleep 0.3
  end

  describe '購入する' do
    context '商品を購入できる時' do
      it 'すべての空欄が埋まっていれば購入できる' do
        expect(@ordersend).to be_valid
      end
      it 'build以外が埋まっていれば購入できる' do
        @ordersend.building = ''
        expect(@ordersend).to be_valid
      end
    end

    context '購入できない' do
      it 'post_codeが空欄だと購入できない' do
        @ordersend.post_code = ''
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Post code can't be blank")
      end
      it 'municipalitiesが空欄だと購入できない' do
        @ordersend.municipalities = ''
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空欄だと購入できない' do
        @ordersend.address = ''
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空欄だと購入できない' do
        @ordersend.tel = ''
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Tel can't be blank")
      end
      it 'prefecture_idが空欄だと購入できない' do
        @ordersend.prefecture_id = ''
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'post_codeにハイフンがない場合購入できない' do
        @ordersend.post_code = '1112222'
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'post_codeの文字数が違うと購入できない' do
        @ordersend.post_code = '11-2222'
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'telが9文字以下だと購入できない' do
        @ordersend.tel = '123456789'
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Tel is too short (minimum is 10 characters)")
      end
      it 'telが12文字以上だと購入できない' do
        @ordersend.tel = '1234567891023'
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      end
      it 'telが半角数字以外だと購入できない' do
        @ordersend.tel = '１２３４５６７８９０１'
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Tel is invalid. Input only number")
      end
      it 'prefecture_idが1だと購入できない' do
        @ordersend.prefecture_id = '1'
        @ordersend.valid?
        expect(@ordersend.errors.full_messages).to include("Prefecture can't be blank")
      end
    end
  end
end
