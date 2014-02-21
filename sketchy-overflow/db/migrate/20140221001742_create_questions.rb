class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |col|
      col.text :content
      col.belongs_to :user
      col.timestamps
    end
  end
end
