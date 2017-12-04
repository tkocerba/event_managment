module SessionConcern
  extend ActiveSupport::Concern

  included do 
    def sign_in(user)
      cookies.pernament.signed[:user_id] = user.id
    end
  end

end