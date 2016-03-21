class CreateVirtualDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
