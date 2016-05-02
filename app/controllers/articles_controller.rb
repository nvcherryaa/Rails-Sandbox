class ArticlesController < ApplicationController

  def new
    if !session[:current_user_id]
      redirect_to root_path
    end

    @article = Article.new
  end

  def create

    @article = Article.new(article_params)
    @article.user_id = session[:current_user_id]
    @user = User.find(session[:current_user_id])
    if @article.save
      flash[:notice] = "Article successfully created"
      redirect_to user_path(@user)
    else
      render :new
    end
  end


  private

  def article_params
    params.require(:article).permit(:description, :user_id)
  end


end
