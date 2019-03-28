FactoryBot.define do
  factory :question do
    sequence(:subject) {'subject'}
    sequence(:description) {'descricao da questão'}
    #activated true
  end


end