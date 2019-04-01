FactoryBot.define do
  factory :admin do
    sequence(:email) {|n| "TESTE#{n}@ID.UFF.BR"}
    password {'password'}

    #activated {true}

  end

end