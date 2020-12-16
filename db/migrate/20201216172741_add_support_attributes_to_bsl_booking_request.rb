class AddSupportAttributesToBslBookingRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :bsl_booking_requests, :support, :string, default: 'no', null: false
    add_column :bsl_booking_requests, :support_name, :string, default: '', null: false
    add_column :bsl_booking_requests, :support_relationship, :string, default: '', null: false
    add_column :bsl_booking_requests, :support_email, :string, default: '', null: false
    add_column :bsl_booking_requests, :support_phone, :string, default: '', null: false
  end
end
