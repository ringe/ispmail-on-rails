class CreateVirtualUsers < ActiveRecord::Migration
  def change
    begin
      create_table :virtual_users do |t|
        t.references :domain, index: true, null: false
        t.string :password, null: false
        t.string :email, null: false

        t.timestamps null: false
      end
      add_index :virtual_users, :email, unique: true
      add_foreign_key :virtual_users, :domains, on_delete: :cascade
    rescue
    end
  end
end
