class Show < ActiveRecord::Base
  def self.highest_rating
    self.all.maximum(:rating)
  end

  def self.most_popular_show
    self.find_by("rating = ?", highest_rating)
  end

  def self.lowest_rating
    self.all.minimum(:rating)
  end

  def self.least_popular_show
    self.find_by("rating = ?", lowest_rating)
  end

  def self.ratings_sum
    self.sum(:rating)
  end

  def self.popular_shows
    self.where("rating > 5")
  end

  def self.shows_by_alphabetical_order
    #self.all.sort{|show1, show2| show1.name <=> show2.name}
    self.all.order(:name)
  end
end
