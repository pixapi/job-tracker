class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :e_mail
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
