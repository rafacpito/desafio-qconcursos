class CreateQuestionAccess < ActiveRecord::Migration[5.2]
  def change
    create_table :question_accesses do |t|
      t.integer     :times_accessed
      t.datetime    :date
      t.references  :question, foreign_key: true
    end
  end
end
