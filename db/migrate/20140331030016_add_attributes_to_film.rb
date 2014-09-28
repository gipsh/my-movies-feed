class AddAttributesToFilm < ActiveRecord::Migration
  def change
    add_column :films, :year, :string
    add_column :films, :cover, :string
    add_column :films, :imbdbcode, :string
    add_column :films, :rating, :string
    add_column :films, :magnet, :string
  end
end
