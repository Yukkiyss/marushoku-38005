require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    @store = FactoryBot.build(:store)
  end

  describe '店舗情報入力' do
    context '店舗情報登録できる場合' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@store).to be_valid
      end
    end

    context '店舗情報登録できない場合' do
      it 'imageが空だと出品できない' do
        @store.image = nil
        @store.valid?
        expect(@store.errors.full_messages).to include("Image can't be blank")
      end

      it 'store_nameが空だと出品できない' do
        @store.store_name = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Store name can't be blank")
      end

      it 'category_id未選択だと出品できない' do
        @store.category_id = 1
        @store.valid?
        expect(@store.errors.full_messages).to include("Category can't be blank")
      end

      it 'store_environmentが空だと出品できない' do
        @store.store_environment = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Store environment can't be blank")
      end

      it 'recommendationが空だと出品できない' do
        @store.recommendation = ''
        @store.valid?
        expect(@store.errors.full_messages).to include("Recommendation can't be blank")
      end

      it 'userが紐付いていなければ出品できない' do
        @store.user = nil
        @store.valid?
        expect(@store.errors.full_messages).to include('User must exist')
      end

    end



  end


end
