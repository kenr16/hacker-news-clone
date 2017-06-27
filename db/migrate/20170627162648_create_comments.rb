class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.column :text, :string
      t.column :author, :string
      t.column :post_id, :integer
      t.column :reply_id, :integer

      t.timestamps
    end
  end
end
