# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]

  def index
    @articles = Article.all
  end

  def new
    # initialization for form_for method in new.html.erb
    @article = Article.new
  end

  def edit; end

  def create
    # handling what is being sent
    # dislaying what is being passed in
    # render plain: params[:article].inspect

    # THIS IS NOT THE PREFFERED WAY TO DO ITs
    # @article.save
    # redirecting to the show template in order to show the article when its created
    # redirect_to article_path(@article)

    # THE PREFFERED WAY
    # initializing a new instance and validating
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = 'Article was successfully created'
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article was successfully updated'
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @article.destroy
    flash[:danger] = 'Article was successfully deleted'
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
