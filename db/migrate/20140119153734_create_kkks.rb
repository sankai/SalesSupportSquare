class CreateKkks < ActiveRecord::Migration
  def change
    create_table :kkks do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
