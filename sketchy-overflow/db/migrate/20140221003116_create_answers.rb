class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |col|
      col.text :content
      col.belongs_to :question
      col.integer :votes
      col.timestamps
    end
  end
end
