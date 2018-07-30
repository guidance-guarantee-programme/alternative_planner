class CreateBookingRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_requests do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :memorable_word, null: false
      t.string :gdpr_consent, null: false, default: ''
      t.string :additional_info, null: false, default: ''
      t.date :date_of_birth, null: false
      t.boolean :defined_contribution_pot_confirmed, null: false
      t.boolean :accessibility_needs, null: false
      t.integer :where_you_heard, null: false
      t.belongs_to :location, index: true, foreign_key: true

      t.timestamps
    end
  end
end
