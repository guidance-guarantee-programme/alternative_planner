class SlackPingerJob < ApplicationJob
  include ActionView::Helpers::TextHelper

  queue_as :default

  def perform(booking_request)
    return unless hook_uri

    hook = WebHook.new(hook_uri)
    hook.call(payload(booking_request))
  end

  private

  def hook_uri
    ENV['SLACK_PINGER_URI']
  end

  def payload(booking_request)
    booking_request = BookingRequestDecorator.new(booking_request)

    {
      username: 'tomjones',
      channel: '#online-bookings',
      text: ":rotating_light: #{booking_request.booking_type} :rotating_light:",
      icon_emoji: ':flag-wales:'
    }
  end
end
