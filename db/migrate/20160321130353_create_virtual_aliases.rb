class CreateVirtualAliases < ActiveRecord::Migration
  def change
    begin
      create_table :virtual_aliases do |t|
        t.references :domain, index: true, null: false
        t.string :source, null: false
        t.string :destination, null: false

        t.timestamps null: false
      end
      add_foreign_key :virtual_aliases, :domains, on_delete: :cascade
    rescue
    end
  end
end
