class CreateBslBookingRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :bsl_booking_requests do |t|
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

      t.timestamps
    end
  end
end
