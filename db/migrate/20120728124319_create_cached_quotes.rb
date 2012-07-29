class CreateCachedQuotes < ActiveRecord::Migration
  def change
    create_table :cached_quotes do |t|
      t.string  :hashed_key
      t.text    :quoted_text, null: false
      t.string  :author
      t.string  :sourcelink
      t.references :quote_source

      t.timestamps
    end

    add_index :cached_quotes, :hashed_key, unique: true
    add_index :cached_quotes, :quote_source_id
  end
end
