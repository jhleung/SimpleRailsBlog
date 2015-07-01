class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author_name
      t.text :body
      t.references :post, index: true, foreign_key: true
      t.boolean :approved
      t.timestamps null: false
    end
  end
end
