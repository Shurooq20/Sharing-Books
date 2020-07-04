class AddToChallenges < ActiveRecord::Migration[6.0]
  def change
  add_column :challenges, :completed, :boolean, default: false
  end
end
