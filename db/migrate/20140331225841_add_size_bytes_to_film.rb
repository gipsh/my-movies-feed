class AddSizeBytesToFilm < ActiveRecord::Migration
  def change
    add_column :films, :sizebytes, :string
  end
end
