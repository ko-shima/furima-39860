require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'nicknameとemail、passwordとpassword_confirmation、名前、誕生日が存在すれば登録できる' do
    expect(@user).to be_valid
  end
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
  it 'last_nameが空では登録できない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end
  it 'first_nameが空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end
  it 'last_name_kanaが空では登録できない' do
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank")
  end
  it 'first_name_kanaが空では登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end
  it 'birthdayが空では登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
  it 'passwordとpassword_confirmationが不一致では登録できない' do
    @user.password_confirmation = 'asdfgh1'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it '重複したemailが存在する場合は登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
  it 'emailは@を含まないと登録できない' do
    @user.email = '111111'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  it 'passwordが5文字以下では登録できない' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'passwordが129文字以上では登録できない' do
    @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
  @user.password_confirmation = @user.password
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
end

end
