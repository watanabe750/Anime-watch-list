class CreateAnimes < ActiveRecord::Migration[8.0]
  def change
    create_table :animes do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
