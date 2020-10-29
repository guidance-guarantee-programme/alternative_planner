class AddProcessedAtToBslBookingRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :bsl_booking_requests, :processed_at, :datetime
  end
end
