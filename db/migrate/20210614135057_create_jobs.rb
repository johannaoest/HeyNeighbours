class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :details
      t.string :location
      t.date :date
      t.integer :duration
      t.integer :price
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
