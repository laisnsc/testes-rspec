FactoryBot.define do
  factory :admin2 do
    sequence(:email) {"testeYY@id.uff.br"}
    sequence(:password) {'password'}
    activated {true}

  end

  factory :admin, class: 'Admin' do
    sequence(:email) {"adminx@id.uff.br"}
    sequence(:password) {'12345678'}
     #admin true
     #activated true
   end
end