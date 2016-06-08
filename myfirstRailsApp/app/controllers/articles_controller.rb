class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created..."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = set_article
  end

  def destroy
    @article = set_article
    @article.destroy
    flash[:notice] = "Article was Successfully deleted"
    redirect_to articles_path
  end

  def edit
    @article = set_article
  end

  def update
    @article = set_article
    if @article.update(article_params)
      flash[:notice] = "Article was Successfully updated"
      redirect_to article_path(@article)

    else
      render 'edit'
    end

  end

  private

  def set_article
     @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
