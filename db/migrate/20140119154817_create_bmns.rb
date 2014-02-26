class CreateBmns < ActiveRecord::Migration
  def change
    create_table :bmns do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
