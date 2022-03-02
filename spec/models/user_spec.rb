require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it '空欄が全て埋まっていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '重複するemailが存在するときは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_name_katakanaが空だと登録できない' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナを入力してください")
      end
      it 'first_name_katakanaが空だと登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'passwordが英語だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'last_nameが半角だと登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字全角文字を使用してください")
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前全角文字を使用してください")
      end
      it 'last_name_katakanaがひらがなだと登録できない' do
        @user.last_name_katakana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナ全角カタカナを使用してください")
      end
      it 'last_name_katakanaが漢字だと登録できない' do
        @user.last_name_katakana = '亜'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナ全角カタカナを使用してください")
      end
      it 'last_name_katakanaが英字だと登録できない' do
        @user.last_name_katakana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナ全角カタカナを使用してください")
      end
      it 'last_name_katkanaが半角だと登録できない' do
        @user.last_name_katakana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナ全角カタカナを使用してください")
      end
      it 'first_name_katakanaがひらがなだと登録できない' do
        @user.first_name_katakana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ全角カタカナを使用してください")
      end
      it 'first_name_katakanaが漢字だと登録できない' do
        @user.first_name_katakana = '亜'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ全角カタカナを使用してください")
      end
      it 'first_name_katakanaが英字だと登録できない' do
        @user.first_name_katakana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ全角カタカナを使用してください")
      end
      it 'first_name_katakanaが半角だと登録できない' do
        @user.first_name_katakana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ全角カタカナを使用してください")
      end
    end
  end
end
