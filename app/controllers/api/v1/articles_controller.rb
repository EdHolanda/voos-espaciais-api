class Api::V1::ArticlesController <ApplicationController
    
    before_action :set_article, only: [:show, :update, :destroy]
    #skip_before_action :verify_autenticity_token
    def index
        @articles = Article.paginate(page: params[:page] || 1, per_page: 3)
        @articles = @articles.map{|article| article.format_json}
        render json: @articles.to_json, status: 200
    end

    def show
        @article = @article.format_json
        render json: @article.to_json, status: 200
    end

    # POST /articles
    def create
        @article = Article.new(article_params)
        if @article.save
            render json: @article, status: :created, location: api_v1_articles_url(@article)
        else
            render json: @article.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /articles/1
    def update
        if @article.update(article_params)
            render json: @article, location: api_v1_articles_url(@article)
        else
            render json: @article.errors, status: :unprocessable_entity
        end
    end

    # DELETE /articles/1
    def destroy
        @article.destroy
    end

    # def busca
    #     where(id_orig:"id_orig")
    # end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
        @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
        params.permit(:title,:url,:imageUrl,:newsSite,:summary,:publishedAt,:updatedAt,:launches,:events)
    end


    
end



