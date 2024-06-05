class CreateQuizResults < ActiveRecord::Migration[7.1]
  def change
    create_table :quiz_results do |t|
      t.integer :number_correct
      t.string :user_id

      t.timestamps
    end
  end
end
