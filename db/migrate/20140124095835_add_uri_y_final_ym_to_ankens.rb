class AddUriYFinalYmToAnkens < ActiveRecord::Migration
  def change
    add_column :ankens, :uri_y_final, :string
  end
end
