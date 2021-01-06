Rails.application.routes.draw do
  get 'hottest', to: 'questions#hottest'
  get 'hottest_in_period', to: 'questions#hottest_in_period'
end
