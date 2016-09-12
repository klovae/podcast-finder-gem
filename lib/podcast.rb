class Podcast
  extend Concerns::Findable

  attr_accessor :name, :url
  attr_reader :station, :category, :description

  @@all = []

  def initialize(podcast_hash)
    @name = podcast_hash(:name)
    @url = podcast_hash(:url)
    @episodes = []
    self.save
  end

  def category=(category)
    if category.class == Category
      @category = category
    end
  end

  def station=(station)
    if station.class == Station
      @station = station
    end
  end


  def description=(description)
    @description = description
  end


  def self.create(name)
    podcast = self.new(name)
    podcast.save
  end

  def save
    @@all << self

  def self.all
    @@all
  end

end
