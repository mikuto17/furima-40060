require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'nicknameが空では登録できない' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it 'emailが空では登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordとpassword_confirmationが不一致では登録できない' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'emailは@を含まないと登録できない' do
    @user.email = 'testmail'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end
  it 'passwordが5文字以下では登録できない' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'passwordが数字だけだと登録できない' do
    @user.password ='11111111'
    @user.password_confirmation = '11111111'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")
  end
  it 'passwordが英字だけだと登録できない' do
    @user.password = 'aaaaaaaa'
    @user.password_confirmation = 'aaaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")
  end
  it 'passwordが全角だと登録できない' do
    @user.password = 'ああああああ'
    @user.password_confirmation = 'ああああああ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")   
  end
  it 'first_nameが空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
  end
  it 'first_nameが半角では登録できない' do
    @user.first_name = 'aaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
  end
  it 'last_nameが空では登録できない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
  end
  it 'last_nameが半角では登録できない' do
    @user.last_name = 'aaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name 全角ひらがな、全角カタカナ、漢字で入力して下さい")
  end
  it 'first_kanaが空では登録できない' do
    @user.first_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First kana can't be blank", "First name kana 全角カタカナで入力して下さい")
  end
  it 'first_kanaが半角では登録できない' do
    @user.first_kana = 'aaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("First kana 全角カタカナで入力して下さい")
  end
  it 'last_kanaが空では登録できない' do
    @user.last_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last kana can't be blank", "First name kana 全角カタカナで入力して下さい")
  end
  it 'last_kanaが半角では登録できない' do
    @user.last_kana = 'aaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last kana 全角カタカナで入力して下さい")
  end
  it 'birthdayが空では登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end 
