class CreateSubreddits < ActiveRecord::Migration[7.1]
  def change
    create_table :subreddits do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
