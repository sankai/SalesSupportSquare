class CreateMailsents < ActiveRecord::Migration
  def change
    create_table :mailsents do |t|
      t.integer :mailtemplate_id
      t.datetime :sent_time

      t.timestamps
    end
  end
end
