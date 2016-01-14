Hello.configure do |config|
  config.mailer_sender = 'hello@example.com'

  config.email_presence = true
  config.email_regex  = /\A[A-Z0-9._-]+@[A-Z0-9.-]+\.[A-Z0-9.-]+\z/i
  config.email_length = 4..250

  config.username_presence = true
  config.username_regex  = /\A[a-z0-9_-]+\z/i
  config.username_length = 4..32

  config.password_presence = true
  config.password_regex  = /\A[a-z0-9]+\z/i
  config.password_length = 4..250

  # User Registration
  config.email_sign_up_role          = 'onboarding'
  config.email_sign_up_fields        = %w(name username time_zone locale city)
  config.extensions.email_sign_up    = Hello::Extensions::EmailSignUp
  # User Authentication
  config.extensions.email_sign_in    = Hello::Extensions::EmailSignIn
  config.extensions.forgot_password  = Hello::Extensions::ForgotPassword
  config.extensions.reset_password   = Hello::Extensions::ResetPassword
  config.extensions.encrypt_password = Hello::Extensions::EncryptPassword
  # Account Management
  config.extensions.update_profile   = Hello::Extensions::UpdateProfile
  config.extensions.cancel_account   = Hello::Extensions::CancelAccount
end
