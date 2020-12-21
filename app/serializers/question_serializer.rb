class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :statement, :text, :answer, :discipline
end
