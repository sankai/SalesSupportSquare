class CreateUrijs < ActiveRecord::Migration
  def change
    create_table :urijs do |t|
      t.integer :year
      t.integer :month
      t.float :amount
      t.integer :anken_id

      t.timestamps
    end
  end
end
