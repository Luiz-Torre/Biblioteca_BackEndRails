class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :client



  validates :expiry_date,:client_id, :book_id, presence: true
  validate :loan_open , on: [:create]
  enum status: {closed: 0 ,open: 1}


  def loan_open
    check = Loan.find_by(client_id: self.client_id, status: "open")
    if check.present?
      self.errors.add(:loan_open, "Emprestimo em aberto. Devolva o livro antes de pegar outro.")
    end
  end

  def delay_days 
    if Loan.find(self.id).status == "open"
        today = Time.now.to_date  
        last_day = Loan.find(self.id).expiry_date
        result = ((today - last_day).to_i)
        self.update_attribute(:delay_days, result)
        return result
    
    else
      return 0
    end
  end

    def fine
      if Loan.find(self.id).status == "open"
        #Darei 5.37 reais de multa por dia que passar.
        aux_number = Loan.find(self.id).delay_days
        multa = 5.37
        if aux_number  > 0
          fine_final = (aux_number*multa)
        else
          fine_final = 0
        end
        self.update_attribute(:fine, fine_final)
        return fine_final

      else
        return 0
      end
    end





end
