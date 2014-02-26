class AddDEmailToBmns < ActiveRecord::Migration
  def change
    add_column :bmns, :d_email, :string
  end
end
