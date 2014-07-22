module Hello
  class RegistrationReset
    include ActiveModel::Model

    attr_reader :credential

    def initialize(unencrypted_token=nil)
      if unencrypted_token
        find_credential(unencrypted_token)
      end
    end

    def update_password(password)
      credential.password = password
      merge_errors_to_self and return false unless credential.save
      return true
    end

    def errors
      @errors ||= ActiveModel::Errors.new(self)
    end

    def error_message
      I18n.t("hello.messages.classic.registration.reset_password.error", count: errors.count)
    end




    private

        # initialize helpers

        def find_credential(unencrypted_token)
          token_digest = Credential.encrypt_token(unencrypted_token)
          @credential    = Credential.classic.where(password_token_digest: token_digest).first
        end

        # update password helpers

        def merge_errors_to_self
          hash = credential.errors.to_hash
          hash.each { |k,v| v.each { |v1| errors.add(k, v1) } }
        end

        # helpers

  end
end
