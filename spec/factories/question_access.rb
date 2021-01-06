FactoryBot.define do
  factory :question_access do
    times_accessed { 12 }
    date { DateTime.now - 2.days }
    question
  end
end