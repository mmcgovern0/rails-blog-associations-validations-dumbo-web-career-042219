class TagsController < ApplicationController
	def index
		@tags = Tag.all
	end

	def show
		set_tag
	end

	def new
		@tag = Tag.new
	end

	def create
		@tag = Tag.create(tag_params)
		redirect_to @tag
	end

	def edit
		set_tag
	end

	def update
		set_tag
		@tag.update(tag_params)
		redirect_to @tag
	end

	def delete
		set_tag
		@tag.destroy
		redirect_to tags_path
	end

	private

	def set_tag
		@tag = Tag.find(params[:id])
	end

	def tag_params
		params.require(:tags).permit(:name)
	end
end
