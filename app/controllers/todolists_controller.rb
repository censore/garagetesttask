class TodolistsController < ApplicationController
  before_action :set_todolist, only: [:show, :edit, :update, :destroy]

  # GET /todolists
  # GET /todolists.json
  def index
    @todolists = Todolist.all
    @tasks = Task.all
  end

  # GET /todolists/1
  def show
  end

  # GET /todolists/new
  def new
    @todolist = Todolist.new
  end

  # GET /todolists/1/edit
  def edit
  end

  # POST /todolists/create
  # POST /todolists.json/create
  def create
    @todolist = Todolist.new(todolist_params)
    respond_to do |format| 
      if @todolist.save
        format.html { redirect_to @todolist, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @todolist }
      else
        format.html { render action: 'new' }
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todolists/1
  def update
    if @todolist.update(todolist_params)
      redirect_to @todolist, notice: 'Todolist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /todolists/1
  def destroy
    @todolist.destroy
    redirect_to todolists_url, notice: 'Todolist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todolist
      @todolist = Todolist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todolist_params
      params.require(:todolist).permit(:title)
    end
end
