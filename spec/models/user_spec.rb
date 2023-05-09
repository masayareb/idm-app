require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できる時' do
      it 'name、email、password、password_confirmation、employee_number、affiliation、adminが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it "nameが空だと登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it "emailが空では登録できない" do
	      @user.email = ''
	      @user.valid?
	      expect(@user.errors.full_messages).to include ("Email can't be blank")
	    end

      it "emailが一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "emailは、@がないと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end

      it "passwordが6文字未満だと登録できない" do
        @user.password = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end

      it "passwordとpassword（確認）が一致しないと登録できない" do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end

      it "passwordは半角英数字混合でないと登録できない_数字のみ" do
        @user.password = '00000000'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password Password is invalid. Include both letters and numbers")
      end

      it "passwordは半角英数字混合でないと登録できない_英字のみ" do
        @user.password = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password Password is invalid. Include both letters and numbers")
      end

      it "passwordは半角英数字混合でないと登録できない_数字・英字のみ" do
        @user.password = 'aa00000000'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password Password is invalid. Include both letters and numbers")
      end
    end

    it "passwordは半角英数字混合でないと登録できない_全角" do
      @user.password = 'ａａａａａａａａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password Password is invalid. Include both letters and numbers")
    end

    it "employee_numberが空だと登録できない" do
      @user.employee_number = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Employee number can't be blank")
    end

    it "employee_numberが一意性でないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.employee_number = @user.employee_number
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Employee number has already been taken')
    end

    it "employee_numberが全角だと登録できない" do
      @user.employee_number = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Employee number is invalid")
    end
      
    it "affiliationが空だと登録できない" do
      @user.affiliation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Affiliation can't be blank")
    end

    it "adminが空だと登録できない" do
      @user.admin = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Admin is not included in the list")
    end
  
  end
end