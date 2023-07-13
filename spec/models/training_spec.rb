require 'rails_helper'

RSpec.describe Training, type: :model do
  before do
    @training = FactoryBot.build(:training)
  end

  describe 'トレーニング内容登録' do
    context '新規登録できるとき' do
      it '必要情報が全て存在すれば登録できる' do
        expect(@training).to be_valid
      end
    end

    context '登録できないとき' do
      it 'training_nameが空だと登録できない' do
        @training.training_name = ''
        @training.valid?
        expect(@training.errors.full_messages).to include('トレーニング名を入力してください')
      end

      it 'training_nameは全角でないと登録できない' do
        @training.training_name = '111'
        @training.valid?
        expect(@training.errors.full_messages).to include('トレーニング名は全角文字を使用してください')
      end

      it 'weightが空だと登録できない' do
        @training.weight = ''
        @training.valid?
        expect(@training.errors.full_messages).to include('重量を入力してください')
      end

      it 'weightは数字でないと登録できない' do
        @training.weight = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include('重量は数値で入力してください')
      end

      it 'numberが空だと登録できない' do
        @training.number = ''
        @training.valid?
        expect(@training.errors.full_messages).to include('回数を入力してください')
      end

      it 'numberは数字でないと登録できない' do
        @training.number = 'あああ'
        @training.valid?
        expect(@training.errors.full_messages).to include('回数は数値で入力してください')
      end
    end
  end
end
