class CreateMailtemplates < ActiveRecord::Migration
  def change
    create_table :mailtemplates do |t|
      t.string :name
      t.string :title
      t.text :banner
      t.text :content
      t.text :trailer

      t.timestamps
    end
  end
end
