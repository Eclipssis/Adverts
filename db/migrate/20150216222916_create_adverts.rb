class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.integer :user_id
      t.string :title
      t.string :author
      t.string :image
      t.text :text

      t.timestamps
    end
  end
end
