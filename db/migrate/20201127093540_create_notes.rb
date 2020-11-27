class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :message
      t.belongs_to :user
      t.references :notable, polymorphic: true

      t.timestamps
    end
  end
end
