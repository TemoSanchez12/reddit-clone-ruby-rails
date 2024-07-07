class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :votable_id
      t.string :votable_type
      t.integer :value

      t.timestamps
    end
  end
end
