class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :statement, :text, :answer, :discipline, :daily_access
end
