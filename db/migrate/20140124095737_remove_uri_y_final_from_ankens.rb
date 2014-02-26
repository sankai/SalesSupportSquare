class RemoveUriYFinalFromAnkens < ActiveRecord::Migration
  def change
    remove_column :ankens, :uri_y_final, :integer
  end
end
