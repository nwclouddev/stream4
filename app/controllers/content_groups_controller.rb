# frozen_string_literal: true

class ContentGroupsController < ApplicationController
  before_action :set_content_group, only: %i[show edit update destroy]

  # GET /content_groups or /content_groups.json
  def index
    @content_groups = ContentGroup.all
  end

  # GET /content_groups/1 or /content_groups/1.json
  def show; end

  # GET /content_groups/new
  def new
    @content_group = ContentGroup.new
  end

  # GET /content_groups/1/edit
  def edit; end

  # POST /content_groups or /content_groups.json
  def create
    @content_group = ContentGroup.new(content_group_params)

    respond_to do |format|
      if @content_group.save
        format.html { redirect_to content_group_url(@content_group), notice: 'Content group was successfully created.' }
        format.json { render :show, status: :created, location: @content_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_groups/1 or /content_groups/1.json
  def update
    respond_to do |format|
      if @content_group.update(content_group_params)
        format.html { redirect_to content_group_url(@content_group), notice: 'Content group was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_groups/1 or /content_groups/1.json
  def destroy
    @content_group.destroy!

    respond_to do |format|
      format.html { redirect_to content_groups_url, notice: 'Content group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_content_group
    @content_group = ContentGroup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def content_group_params
    params.require(:content_group).permit(:name, :description)
  end
end
