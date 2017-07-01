class ArticlesController < ApplicationController
before_action :set_param, only: [:edit, :update, :show,:destroy]
def new

	@article = Article.new

end
def edit
	
	
end

def index
	@articles = Article.all
end

def destroy
	
	@article.destroy
	flash[:notice] = "Article was successfully deleted"
	redirect_to articles_path
end

	def create

		@article =Article.new(article_params)
		if @article.save

			flash[:notice] = "Article was successfully created"

			redirect_to articles_path(@article)

		else

			render 'new'
	
		end

	end
	
	def update
	
	if @article.update(article_params)
		flash[:notice] = "Article is successfully updated"
		redirect_to articles_path(@article)
	else
		render 'edit'
	end
end
	
	def show

		
	end
	
	private
	
	def set_param
		@article =Article.find(params[:id])
	
	end

		def article_params
	
			params.require(:article).permit(:title, :description)

		end	

 end