FactoryBot.define do
  factory :question do
    statement { "Teste" }
    text  { "Teste" }
    answer  { "Teste" }
    discipline  { "Teste" }
    daily_access  { 24 }
  end
end