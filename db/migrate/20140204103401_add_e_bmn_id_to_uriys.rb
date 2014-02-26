class AddEBmnIdToUriys < ActiveRecord::Migration
  def change
    add_column :uriys, :e_bmn_id, :integer
  end
end
