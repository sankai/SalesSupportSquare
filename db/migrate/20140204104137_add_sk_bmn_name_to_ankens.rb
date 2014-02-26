class AddSkBmnNameToAnkens < ActiveRecord::Migration
  def change
    add_column :ankens, :sk_bmn_name, :string
  end
end
