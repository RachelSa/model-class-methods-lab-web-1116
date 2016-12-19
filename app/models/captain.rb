class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    joins(boats: :classifications).where(classifications: {name: "Catamaran" })

  end

  def self.sailors
    joins(boats: :classifications).where(classifications: {name: "Sailboat" }).uniq
  end

  def self.talented_seamen
    #binding.pry
    sailors = self.joins(boats: :classifications).where( "classifications.name ='Sailboat'")
    motors = self.joins(boats: :classifications).where( "classifications.name ='Motorboat'")
    sailors.where(id: motors).uniq
    #Captain.where(id: Captain.sailors & Captain.motors)
    #self.joins(boats: :classifications).where("classifications.name = 'Sailboat' OR classifications.name = 'Motorboat'")

  
    
  end

   def self.non_sailors
    #binding.pry
    sailors = self.joins(boats: :classifications).where("classifications.name = 'Sailboat'")
    self.where.not(id: sailors)
   end

end