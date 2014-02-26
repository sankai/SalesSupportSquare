class RemoveSkBmnIdFromAnkens < ActiveRecord::Migration
  def change
    remove_column :ankens, :sk_bmn_id, :integer
  end
end
