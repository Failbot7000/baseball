class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :TeamOne
      t.string :TeamTwo
      t.integer :TeamOneVotes
      t.integer :TeamTwoVotes

      t.timestamps null: false
    end
  end
end
