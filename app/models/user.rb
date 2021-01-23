class User < ApplicationRecord
    has_secure_password
    

    #relações
    has_one :admin
    has_one :clerk
    has_one :client

    #validações
    validates :name, :email, :telephone,:password_confirmation, presence: true 
    validates :email, :cpf, presence: true, uniqueness: true

    #funções
    enum role: {client: 0, clerk: 1, admin: 2}

    after_create :createRole
    def createRole
        if self.client?
            userRole = Client.new(user_id: self.id)
        elsif self.clerk?
            userRole = Clerk.new(user_id: self.id)
        elsif self.admin?
            userRole= Admin.new(user_id: self.id)
        end
        userRole.save
    end
end