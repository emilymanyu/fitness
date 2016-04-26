class Uuser < ActiveRecord::Base

		def self.sign_in_from_omniauth(auth)
      find_by(provider: auth['provider'], uid: auth['uid'],id: auth['id'] ) || create_uuser_from_omniauth(auth)
    end

    def self.create_uuser_from_omniauth(auth)
      create(
        provider: auth['provider'],
        uid: auth['uid'],
        name: auth['info']['name'],
        id: auth['id']
        )       
    end
    
end
