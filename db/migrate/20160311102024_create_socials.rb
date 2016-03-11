class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :kind
      t.string :username
      t.timestamps null: false
      t.belongs_to :profiles, index: true, foreign_key: true
    end
  end
end
