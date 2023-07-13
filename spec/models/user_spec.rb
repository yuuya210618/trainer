require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要情報が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it '重複したemailが存在すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it '@が含まれていないemailは登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordは5文字以下では登録できない' do
        @user.password = '123aa'
        @user.password_confirmation = '123aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordとpassword_confirmationが異なっていると登録できない' do
        @user.password = '1234aa'
        @user.password_confirmation = '12345aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'body_weightが空では登録できない' do
        @user.body_weight = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('体重を入力してください')
      end

      it 'body_weightは数字でないと登録できない' do
        @user.body_weight = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('体重は数値で入力してください')
      end

      it 'body_weightは空では登録できない' do
        @user.height = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('身長を入力してください')
      end

      it 'body_weightは数字でないと登録できない' do
        @user.height = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('身長は数値で入力してください')
      end
    end
  end
end
