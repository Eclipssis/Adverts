class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :title
      t.string :author
      t.string :image
      t.text :text

      t.timestamps
    end
  end
end
