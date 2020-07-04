class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|

      t.references :book, foreign_key: true
      t.integer :period 
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
