FactoryBot.define do
  factory :admin2 do
    sequence(:email) {"novouser@id.uff.br"}
    sequence(:password) {'password'}
    activated {true}

  end

  factory :admin, class: 'Admin' do
    sequence(:email) {'novoadmin@id.uff.br'}
    sequence(:password) {'12345678'}
     #admin true
     #activated true
   end
end