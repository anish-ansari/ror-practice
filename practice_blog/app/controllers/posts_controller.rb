class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    # using preload
    # @posts = Post.order(created_at: :desc).preload(:author)

    # using eager_load
    # @posts = Post.order("authors.name").eager_load(:author)
    # @posts = Post.order(created_at: :desc).eager_load(:author).where("authors.name = ?", "Manish")
    # @posts = Post.order(created_at: :desc).eager_load(:author)

    # using includes
    # @posts = Post.order("authors.name").includes(:author)
    # @posts = Post.order(created_at: :desc).includes(:author).where("authors.name = ?", "Manish").references(:author)
    # @posts = Post.order(created_at: :desc).includes(:author)

    # using joins
    # @posts = Post.order("authors.name").joins(:author)
    # @posts = Post.order(created_at: :desc).joins(:author).where("authors.name = ?", "John")
    @posts = Post.order(created_at: :desc).joins(:author).select("posts.*, authors.name as author_name")
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :author_id)
    end
end
