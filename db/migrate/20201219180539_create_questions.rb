class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string  :statement
      t.string  :text
      t.string  :answer
      t.string  :discipline
      t.integer :daily_access

      t.timestamps
    end
  end
end
