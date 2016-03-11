class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :kind
      t.string :username
      t.references :sociable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_index :socials, :kind
    add_index :socials, :username
  end
end
