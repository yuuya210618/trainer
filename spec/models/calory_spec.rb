require 'rails_helper'

RSpec.describe Calory, type: :model do
  before do
    @calory = FactoryBot.build(:calory)
  end

  describe '摂取カロリー量登録' do
    context '新規登録できるとき' do
      it '必要情報が全て存在すれば登録できる' do
        expect(@calory).to be_valid
      end
    end

    context '登録できないとき' do
      it 'calories_intakeが空だと登録できない' do
        @calory.calories_intake = ''
        @calory.valid?
        expect(@calory.errors.full_messages).to include("摂取カロリー量を入力してください")
      end

      it 'calories_intakeは数字でないと登録できない' do
        @calory.calories_intake = 'あああ'
        @calory.valid?
        expect(@calory.errors.full_messages).to include("摂取カロリー量は数値で入力してください")
      end


     
    end
  end
end
