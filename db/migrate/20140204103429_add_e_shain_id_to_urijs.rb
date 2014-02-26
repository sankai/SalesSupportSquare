class AddEShainIdToUrijs < ActiveRecord::Migration
  def change
    add_column :urijs, :e_shain_id, :integer
  end
end
