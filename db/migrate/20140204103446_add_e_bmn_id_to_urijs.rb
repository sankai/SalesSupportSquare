class AddEBmnIdToUrijs < ActiveRecord::Migration
  def change
    add_column :urijs, :e_bmn_id, :integer
  end
end
