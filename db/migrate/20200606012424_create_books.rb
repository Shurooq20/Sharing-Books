class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :link
      t.text :description
      t.string :img2_url
      t.integer :rating
      t.timestamps
    end
  end
end
