class QuestionAccessSerializer < ActiveModel::Serializer
  attributes :total_times_accessed
  belongs_to :question, serializer: QuestionSerializer
end
