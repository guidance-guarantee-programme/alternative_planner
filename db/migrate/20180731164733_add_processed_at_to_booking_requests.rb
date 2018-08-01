class AddProcessedAtToBookingRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :booking_requests, :processed_at, :datetime
  end
end
