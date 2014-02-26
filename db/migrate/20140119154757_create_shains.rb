class CreateShains < ActiveRecord::Migration
  def change
    create_table :shains do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
