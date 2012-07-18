require "digest" # source - http://flawlessfuture.com/randomknowledge/?p=262

class Url < ActiveRecord::Base
  attr_accessible :short_url, :short_url_key, :url, :url_views, :user_id
  validates :url, :presence => true, :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }
  
  belongs_to :user
  
  before_create :shorten_url

  def short_url
    "http://dangi.heroku.com/#{self.short_url_key}"
  end

  def self.increment_views(url)
    url.url_views += 1
    url.save
  end

  def self.find_popular(p = 1)
    self.paginate(:page => p, :per_page => 3).order("url_views DESC").all
  end

  def self.find_user_urls(u = 0)
    self.order("url_views DESC").find_all_by_user_id(u)
  end
  
  private
  
    def shorten_url
      begin
        self.short_url_key = Digest::MD5.hexdigest(rand(10000).to_s)[0, 5]
        existing = Url.find_by_short_url_key(self.short_url_key)
      end while ! existing.nil?
    end
    
end