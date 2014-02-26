class CreateUribunyas < ActiveRecord::Migration
  def change
    create_table :uribunyas do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
