class BslBookingRequestDecorator < SimpleDelegator
  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def processed
    object.processed_at? ? 'Yes' : 'No'
  end

  def consent
    object.gdpr_consent.present? ? object.gdpr_consent.titleize : 'No response'
  end

  alias object __getobj__
end
