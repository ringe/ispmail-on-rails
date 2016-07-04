class CreateVirtualDomains < ActiveRecord::Migration
  def change
    begin
      create_table :virtual_domains do |t|
        t.string :name, null: false

        t.timestamps null: false
      end
      add_index :virtual_domains, :name, unique: true
    rescue
    end
  end
end
