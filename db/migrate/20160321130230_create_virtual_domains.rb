class CreateVirtualDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :domains, :name, unique: true
  end
end
