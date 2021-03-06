module AuthenticationHelpers
  def with_real_sso
    sso_env = ENV['GDS_SSO_MOCK_INVALID']
    ENV['GDS_SSO_MOCK_INVALID'] = '1'

    yield
  ensure
    ENV['GDS_SSO_MOCK_INVALID'] = sso_env
  end

  def given_the_user_identifies_as(factory_name)
    @user = create(factory_name)
    GDS::SSO.test_user = @user

    yield
  ensure
    GDS::SSO.test_user = nil
  end
end
