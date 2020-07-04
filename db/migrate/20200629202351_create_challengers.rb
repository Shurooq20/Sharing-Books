class CreateChallengers < ActiveRecord::Migration[6.0]
  def change
    create_table :challengers do |t|
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true
      t.timestamps
    end
  end
end
