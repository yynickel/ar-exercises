class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name, :last_name, :store, presence: true
  validates :hourly_rate, numericality: {greater_than: 40, less_than: 200, only_integer:true}

  # before_create :generate_password
  # private
  #   def generate_password
  #     self.password=[*('a'..'z'),*('0'..'9')].shuffle[0,8].join
  #   end

  # after_create :generate_password
  # private
  #   def generate_password
  #     self.password=[*('a'..'z'),*('0'..'9')].shuffle[0,8].join
  #     self.save # need to add this line to make after_create work
  #   end

  before_save :generate_password
  private
    def generate_password
      self.password=[*('a'..'z'),*('0'..'9')].shuffle[0,8].join
    end

end
