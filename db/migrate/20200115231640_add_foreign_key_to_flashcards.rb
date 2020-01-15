class AddForeignKeyToFlashcards < ActiveRecord::Migration[6.0]
  def change
    add_column :flashcards, :topic_id, :integer
  end
end
