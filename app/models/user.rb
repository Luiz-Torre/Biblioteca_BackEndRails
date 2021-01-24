class User < ApplicationRecord
    has_secure_password
    

    #relações
    has_one :admin
    has_one :clerk
    has_one :client


    #validações
    validates :name, :telephone,:password_confirmation, presence: true 
    validates :email, format: {with: /\b[A-Z0-9._%a-z\-]+@id\.uff\.br\z/, message: "Utilize o seu email da UFF. Exemplo: meuemail@id.uff.br"}
    validates :cpf, format: {with: /\b\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "Utilize um cpf valido. Exemplo: 000.000.000-00"}
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