require 'jwt'

module TokenAuthorization
  class AuthTokenService
    HMAC_SECRET = 'Top#secret'.freeze
    def self.call(email, password)
      payload = { email:, password: }
      JWT.encode payload, HMAC_SECRET, 'HS256'
    end
  end
end