class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :client



  validates :expiry_date, :book_id,  presence: true
  validates :client_id, presence: true,  uniqueness: true




  def delay_days  
    today = Time.now.to_date 
    last_day = Loan.find(self.id).expiry_date
    result = ((today - last_day).to_i)
    self.update_column(:delay_days, result)
    return result
  end

    def fine
      #Darei 5.37 reais de multa por dia que passar.
      aux_number = Loan.find(self.id).delay_days
      multa = 5.37
      if aux_number > 0
        fine_final = (aux_number*multa)
      else
        fine_final = 0
      end
      self.update_column(:fine, fine_final)
      return fine_final
    end

    def status 
      days = Loan.find(self.id).delay_days
      if days > 0
        status_result = 1
        status_text = "Atrasado"
      else
        status_result = 0
        status_text = "Dentro do Prazo"

      end
      self.update_column(:status, status_result)
      return status_text
    end



end
