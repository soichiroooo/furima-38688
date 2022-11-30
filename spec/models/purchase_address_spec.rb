require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.postal_code = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address_lineが空だと保存できないこと' do
        @purchase_address.address_line = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address line can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンを含めると保存できないこと' do
        @purchase_address.phone_number = '000-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @purchase_address.phone_number = '０００１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが電話番号が9桁以下では購入できない' do
        @purchase_address.phone_number = Faker::Number.number(digits: 9)
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが電話番号が12桁以上では購入できない' do
        @purchase_address.phone_number = Faker::Number.number(digits: 12)
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
