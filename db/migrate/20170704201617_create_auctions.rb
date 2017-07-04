class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :description
      t.integer :reserve

      t.timestamps
    end
  end
end
