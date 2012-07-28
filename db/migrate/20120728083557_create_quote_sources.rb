class CreateQuoteSources < ActiveRecord::Migration
  def change
    create_table :quote_sources do |t|
      t.string  :source_url
      t.text    :api_url
      t.string  :source_name
      t.string  :response_type,       default: 'json'
      t.string  :quote_reference,     null: false
      t.string  :permalink_reference
      t.string  :author_reference

      t.timestamps
    end
  end
end
