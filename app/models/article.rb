class Article < ApplicationRecord
  has_many :launches
  has_many :events
  
  def format_json 
    {
      :id => self.id_orig,
      :title => self.title,
      :url => self.url,
      :imageurl => self.imageUrl,
      :newssite => self.newsSite,
      :summary => self.summary,
      :publishedat => self.publishedAt,
      :updatedat => self.updatedAt,
      :featured => self.featured
      #:launches => self.launches,
      #:events => self.events
    }
  end

  def self.buscar_por_id(id)
    @id_article = ActiveRecord::Base.connection.exec_query("select * from articles where id_orig=#{id}")
    return @id_article.map{|a| Article.new(a)}.first
  end

end
