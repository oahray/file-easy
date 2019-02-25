class CreateUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :uploads do |t|
      t.string :name
      t.text :about
      t.string :link
      t.boolean :shared, default: false
      t.boolean :archived, default: false

      t.timestamps

      t.references :user, foreign_key: true
    end
  end
end
