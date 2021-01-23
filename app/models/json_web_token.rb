class JsonWebToken
    Secret = "asdmlkasmlkamskldmaslkdmklasmdaslkmdlaksmaskdmasklmawoiqspd0540"
    def self.encode(payload)
        JWT.encode(payload, Secret)
    end
    def self.decode(token)
        begin
            JWT.decode(token, Secret)
            
        rescue => exception
            return nil    
        end

    end
end