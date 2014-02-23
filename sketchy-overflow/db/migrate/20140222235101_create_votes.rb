class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :question
      t.belongs_to :answer
      t.belongs_to :user
      t.integer :value
    end
  end
end

