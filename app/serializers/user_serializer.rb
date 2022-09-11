class UserSerializer
  class << self
    def new(user)
      require 'pry'; binding.pry 
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