FactoryBot.define do
  factory :question do
    sequence(:subject) {'assunto'}
    sequence(:description) {'descricao da questão'}
    #activated true
  end


end