class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |col|
      col.text :question
      col.belongs_to :user
      col.timestamps
    end
  end
end
