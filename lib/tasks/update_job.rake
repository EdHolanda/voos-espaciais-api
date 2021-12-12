namespace :update_job do
    
  desc "Atualizar banco de dados"
  task atualizar_banco: :environment do

    require 'rest-client'
    url = 'https://api.spaceflightnewsapi.net/v3/articles'
    response = RestClient.get(url)
    articles = JSON.parse(response)
    
    articles.each do |article|
      
      if Date.parse(article["publishedAt"]) == Date.today.prev_day 
        new_article = Article.new
        new_article.id_orig = article["id"]
        new_article.title = article["title"]
        new_article.url = article["url"]
        new_article.imageUrl = article["imageUrl"]
        new_article.newsSite = article["newsSite"]
        new_article.summary = article["summary"]
        new_article.publishedAt = article["publishedAt"]
        new_article.updatedAt = article["updatedAt"]
        new_article.save

        article["launches"].each do |launch|
          new_launch = Launch.new
          new_launch.article_id = new_article.id
          new_launch.provider = launch["provider"]
          new_launch.save
        end
              
        article["events"].each do |event|
          new_event = Event.new
          new_event.article_id = new_article.id
          new_event.provider = event["provider"]
          new_event.save
        end 
   
      elsif Date.parse(article["updatedAt"]) == Date.today.prev_day && Article.buscar_por_id(article["id"]) != nil
        
        ActiveRecord::Base.connection.execute(
        "update articles set 
        title = '#{article['title']}', 
        url = '#{article['url']}',
        imageurl = '#{article['imageUrl']}',
        newssite = '#{article['newsSite']}',
        summary = '#{article['summary']}',
        publishedat = '#{article['publishedAt']}',
        updatedat = '#{article['updatedAt']}'
        where id_orig = '#{article['id']}'"
        )
      
      end

    end
     
  end

end
