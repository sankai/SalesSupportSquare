class AddEmailToShains < ActiveRecord::Migration
  def change
    add_column :shains, :email, :string
  end
end
