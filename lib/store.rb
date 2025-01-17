class Store < ActiveRecord::Base
  has_many :employees

  validates :name, length: {minimum:3}
  validates :annual_revenue, presence:true, numericality: {only_integer:true, greater_than_or_equal_to: 0 }
  validate :must_have_one_of_the_apparels

  def must_have_one_of_the_apparels
    if not (mens_apparel || womens_apparel)
      errors.add("Mens_apparel and womens_apparel", "must have one of the apparels" )
    end
  end
end
