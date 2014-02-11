class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :url
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
