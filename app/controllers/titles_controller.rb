# frozen_string_literal: true

class TitlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_title, only: %i[show edit update destroy]

  # GET /titles or /titles.json
  def index
    # @query = Episode.order(:year, :name).ransack(params[:query])
    # @pagy, @episodes = pagy(@query.result(distinct: true))
    @query = Title.all.order('created_at DESC').ransack(params[:query])
    @pagy, @titles = pagy(@query.result(distinct: true))
  end

  def favorite_titles
    # @query = Episode.order(:year, :name).ransack(params[:query])
    # @pagy, @episodes = pagy(@query.result(distinct: true))
    @favorite_titles = current_user.favorite_titles
    @query = @favorite_titles.order('created_at DESC').ransack(params[:query])
    @pagy, @titles = pagy(@query.result(distinct: true))
  end

  # GET /titles/1 or /titles/1.json
  def show
    @title.visited_at = Time.now
    @title.save
  end

  # GET /titles/new
  def new
    @title = Title.new
    @title.description = 'TBD'
    @title.year = Time.now.year
  end

  # GET /titles/1/edit
  def edit; end

  # POST /titles or /titles.json
  def create
    @title = Title.new(title_params)
    @title.user = current_user
    respond_to do |format|
      if @title.save
        format.html { redirect_to title_url(@title), notice: 'Title was successfully created.' }
        format.json { render :show, status: :created, location: @title }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /titles/1 or /titles/1.json
  def update
    respond_to do |format|
      if @title.update(title_params)
        format.html { redirect_to title_url(@title), notice: 'Title was successfully updated.' }
        format.json { render :show, status: :ok, location: @title }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /titles/1 or /titles/1.json
  def destroy
    @title.destroy!

    respond_to do |format|
      format.html { redirect_to titles_url, notice: 'Title was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_title
    @title = Title.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def title_params
    params.require(:title).permit(:name, :description, :content_url, :thumbnail_url, :year, :user_id,
                                  content_group_ids: [])
  end
end
