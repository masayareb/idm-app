FactoryBot.define do
  factory :item do
    item                {'test'}
    manufacturer        {'メーカー'}
    category_id         {10}
    status_id           {2}
    serial_number       {'a1111111'}
    ip                  {'192.168.100.1'}
    purchase_date       {'2023-10-21'}
    years_of_use        {4}
		remarks             {"テストテストテストテスト"}
		association :user
    #afterメソッドを用いてダミー画像を添付
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end