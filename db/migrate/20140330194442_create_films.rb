class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.text :title
      t.date :published
      t.string :imdb
      t.string :genere
      t.string :quality
      t.string :size
      t.string :runtime
      t.string :link
      t.string :description

      t.timestamps
    end
  end
end
