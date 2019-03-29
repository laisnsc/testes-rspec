FactoryBot.define do
  factory :question do
    association :subject
    description {'descricao da questão'}
    #activated true
  end


end