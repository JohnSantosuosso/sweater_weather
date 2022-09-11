class UserSerializer
  class << self
    def new(user)
      {
        data: {
          type: 'users',
          id: user.id,
          attributes: {
            email: user.email,
            api_key: user.auth_token
          }
        }
      }
    end

    def start_session(user)
      {
        data: {
          type: 'users',
          id: user.id,
          attributes: {
            email: user.email,
            api_key: user.auth_token
          }
        }
      }
    end
  end
end