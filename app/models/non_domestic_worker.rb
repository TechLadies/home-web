class NonDomesticWorker < Worker

  validates :basic_salary, presence: true, numericality: true

end
