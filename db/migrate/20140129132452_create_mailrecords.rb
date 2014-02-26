class CreateMailrecords < ActiveRecord::Migration
  def change
    create_table :mailrecords do |t|
      t.integer :shain_id
      t.integer :mailsent_id

      t.timestamps
    end
  end
end
