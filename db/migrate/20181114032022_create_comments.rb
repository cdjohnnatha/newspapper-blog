# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, foreign_key: true, index: true
      t.references :article, foreign_key: true, index: true

      t.timestamps
    end
  end
end
