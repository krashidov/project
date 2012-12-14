class DietsController < ApplicationController
  before_filter :signed_in_user#, only: [:create, :destroy]
  #before_filter :correct_user, only: [:create, :destroy, :edit, :update]
  # GET /diets
  # GET /diets.json
  def index
    @diets = Diet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diets }
    end
  end

  # GET /diets/1
  # GET /diets/1.json
  def show
    @diet = Diet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @diet }
    end
  end

  # GET /diets/new
  # GET /diets/new.json
  def new
    @diet = Diet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diet }
    end
  end

  # GET /diets/1/edit
  def edit
    @diet = Diet.find(params[:id])
  end

  # POST /diets
  # POST /diets.json
  def create
    @diet = Diet.new(params[:diet])
    @diet = current_user.diets.build(params[:diet])

    respond_to do |format|
      if @diet.save
        format.html { redirect_to current_user }
        format.json { render json: @diet, status: :created, location: @diet }
      else
        format.html { render action: "new" }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diets/1
  # PUT /diets/1.json
  def update
    @diet = Diet.find(params[:id])

    respond_to do |format|
      if @diet.update_attributes(params[:diet])
        format.html { redirect_to @diet, notice: 'Diet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @diet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diets/1
  # DELETE /diets/1.json
  def destroy
    @diet = Diet.find(params[:id])
    @diet.destroy

    respond_to do |format|
      format.html { redirect_to current_user}
      format.json { head :no_content }
    end
  end

  private
  def correct_user
    @diet = Diet.find(params[:id])
    if(@diet != nil)
      @user = User.find(@diet.user_id)
      flash[:notice] = "#{@diet.user_id}"
      redirect_back_or(root_path) unless current_user?(@user)
    end
  end
end
