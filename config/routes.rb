Rails.application.routes.draw do
  get 'hottest_questions', to: 'questions#hottest'
end
