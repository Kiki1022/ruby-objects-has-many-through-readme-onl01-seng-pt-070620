require 'pry'
class Waiter

  attr_accessor :name, :yrs_experience
  
  @@all = []
  
  def initialize (name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
  
  def self.all
    @@all
  end
    
  def new_meal(customer, total, tip = 0) 
    Meal.new(self, customer, total, tip) #creats Waiter instance with associated attr 
  end
  
  def meals
    Meal.all.select {|m| m.waiter == self} #puts Meal class in array associated with waiter (m.waiter == self)
  end  
  
  def best_tipper 
    meals2 = meals.sort_by {|t| t.tip} #sorts array by tip
    best_tip = meals2[-1] #returns Waiter instance and saves in new variable
    best_tip.customer #calling customer of Waiter instance
  end
  
end