class AddSkBmnCodeToAnkens < ActiveRecord::Migration
  def change
    add_column :ankens, :sk_bmn_code, :string
  end
end
