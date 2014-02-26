class AddEShainIdToUriys < ActiveRecord::Migration
  def change
    add_column :uriys, :e_shain_id, :integer
  end
end
