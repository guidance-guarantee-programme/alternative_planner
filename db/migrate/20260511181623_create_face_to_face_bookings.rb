class CreateFaceToFaceBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :face_to_face_bookings do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :memorable_word, null: false
      t.string :gdpr_consent, null: false, default: ''
      t.string :additional_info, null: false, default: ''
      t.date :date_of_birth, null: false
      t.boolean :defined_contribution_pot_confirmed, null: false
      t.boolean :accessibility_requirements, null: false
      t.string :adjustments, default: '', null: false
      t.integer :where_you_heard, null: false
      t.string :support, default: 'no', null: false
      t.string :support_name, default: '', null: false
      t.string :support_relationship, default: '', null: false
      t.string :support_email, default: '', null: false
      t.string :support_phone, default: '', null: false

      t.datetime :processed_at

      t.timestamps
    end
  end
end
