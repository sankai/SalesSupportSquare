class AddDShianNameToBmns < ActiveRecord::Migration
  def change
    add_column :bmns, :d_shian_name, :string
  end
end
