# frozen_string_literal: true

class CreateTableSpreeFavorites < SolidusSupport::Migration[5.1]
  def change
    create_table :spree_favorites do |t|
      t.belongs_to :favorable, polymorphic: true
      t.belongs_to :user, index: true
      t.string :guest_token
      t.timestamps
    end

    add_index :spree_favorites, [:favorable_id, :favorable_type]
    add_index :spree_favorites, :guest_token
  end
end
