class CreateVirtualUsers < ActiveRecord::Migration
  def change
    create_table :virtual_users do |t|
      t.references :domain, index: true, foreign_key: true, null: false
      t.string :password, null: false
      t.string :email, null: false

      t.timestamps null: false
    end
  end
end
