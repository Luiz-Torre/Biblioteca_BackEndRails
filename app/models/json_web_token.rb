class JsonWebToken
    Secret = "asdmlkasmlkamskldmaslkdmklasmdaslkmdlaksmaskdmasklmawoiqspd0540"
    def self.encode(payload)
        JWT.encode(payload, Secret)
    end
    def self.decode
    end
end