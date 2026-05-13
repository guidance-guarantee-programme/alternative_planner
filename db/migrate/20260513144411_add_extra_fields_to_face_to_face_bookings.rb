class AddExtraFieldsToFaceToFaceBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :face_to_face_bookings, :postcode, :string, null: false, default: ''
    add_column :face_to_face_bookings, :referrer, :string, null: false, default: ''
  end
end
