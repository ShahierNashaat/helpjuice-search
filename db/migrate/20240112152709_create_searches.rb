class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :ip
      t.string :search_text
      t.integer :search_numbers

      t.timestamps
    end
  end
end
