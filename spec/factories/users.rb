  FactoryBot.define do
    factory :user do
      name              {'山田 太郎'}
      email                 {'test@example'}
      password              {'Ab000000'}
      password_confirmation {password}
      employee_number {"a1111"}
      affiliation {'福岡支社'}
      admin {'0'} 
    end
  end