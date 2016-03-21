class CreateVirtualAliases < ActiveRecord::Migration
  def change
    create_table :virtual_aliases do |t|
      t.references :domain, index: true, foreign_key: true, null: false
      t.string :source, null: false
      t.string :destination, null: false

      t.timestamps null: false
    end
  end
end
