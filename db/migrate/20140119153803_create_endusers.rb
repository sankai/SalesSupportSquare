class CreateEndusers < ActiveRecord::Migration
  def change
    create_table :endusers do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
