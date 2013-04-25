class CreateStamps < ActiveRecord::Migration
  def change
    create_table :stamps do |t|
      t.references :card
      t.string :initials
      t.string :note
      t.float :duration
      t.date :completed_at
      t.string :tags
    end
    add_index :stamps, :card_id
  end
end
