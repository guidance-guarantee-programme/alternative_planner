# rubocop:disable Rails/UnknownEnv
GovukAdminTemplate.environment_style = Rails.env.staging? ? 'preview' : ENV['RAILS_ENV']

GovukAdminTemplate.configure do |c|
  c.app_title = 'Welsh Planner'
  c.show_flash = true
  c.show_signout = true
end
# rubocop:enable Rails/UnknownEnv
