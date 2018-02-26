class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /news_items
  # GET /news_items.json
  def index
    @post = Post.order('created_at DESC')
  end

  # GET /news_items/1
  # GET /news_items/1.json
  def show
  end

  # GET /news_items/new
  def new
    @post = Post.new
  end

  # GET /news_items/1/edit
  def edit
  end

  # POST /news_items
  # POST /news_items.json
  def create
    @post = Post.new(news_item_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_items/1
  # PATCH/PUT /news_items/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_items/1
  # DELETE /news_items/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to news_items_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    
    def post_params
      params.require(:post).permit(:name, :body, :cover, :post_image, :team_member_id, :branch, :slug, :published_at)
    end
end
