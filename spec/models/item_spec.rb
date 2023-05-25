require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "機器登録情報" do
    context '機器登録ができる' do
      it "item,manufacturer,category_id,status_id,serial_number,ip,purchase_date,years_of_useが存在すれば登録できる" do
        expect(@item).to be_valid
      end

      it '備考が空でも保存ができる' do
        @item.remarks = ''
        expect(@item).to be_valid
      end

      it 'imageが空でも保存ができる' do
        @item.image = ''
        expect(@item).to be_valid
      end

    end

    context '機器登録ができない時' do
      it "userが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it "商品名が空だと登録できない" do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end

      it "メーカー名が空だと登録できない" do
        @item.manufacturer = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Manufacturer can't be blank")
      end

      it "カテゴリが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "ステータスが空だと登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "シリアルナンバーが空だと登録できない" do
        @item.serial_number = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Serial number can't be blank")
      end

      it "シリアルナンバーが一意性でないと登録できない" do
        @item.save
        another_item = FactoryBot.build(:item)
        another_item.serial_number = @item.serial_number
        another_item.valid?
        expect(another_item.errors.full_messages).to include('Serial number has already been taken')
      end

      it "シリアルナンバーが全角だと登録できない" do
        @item.serial_number = "ああああ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Serial number is invalid")
      end

      it "ipが空だと登録できない" do
        @item.ip = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ip can't be blank")
      end

      it "ipがDHCPもしくはxxx.xxx.xxx.xxx形式でないと登録できない（IPアド）" do
        @item.ip = '192.168.000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ip is invalid")
      end

      it "ipがDHCPもしくはxxx.xxx.xxx.xxx形式でないと登録できない（DHCP）" do
        @item.ip = 'DHC'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ip is invalid")
      end

      it "purchase_dateが空だと登録できない" do
        @item.purchase_date = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Purchase date can't be blank")
      end

      it "years_of_useが空だと登録できない" do
        @item.years_of_use = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Years of use can't be blank")
      end

    end
  end
end
