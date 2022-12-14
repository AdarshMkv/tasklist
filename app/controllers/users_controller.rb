class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session
  require 'csv'
  require 'prawn'
  # GET /users or /users.json
  def index
    @users = User.all
    @tasks = Task.all

    respond_to do | format |
      format.html
       format.csv do
         response.headers['Content-Type'] = 'text/csv'
         response.headers['Content-Disposition'] = "attachment; filename=users.csv"
         render template: "users/index"
       end

      format.pdf do 
        pdf = UserPdf.new(@users)
        send_data pdf.render, 
        filename: 'user.pdf',
         type: 'application/pdf',
          disposition: 'attachment'
      end
    end

    

  end

  # GET /users/1 or /users/1.json
  def show
    @tasklists=Task.all.select{|x| x.user_id==set_user.id}
    @tasklist=[]
    @tasklists.each do |task|
      @tasklist.append(task.taskname)
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.first_name.capitalize!
    @user.last_name.capitalize!

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :dob)
    end
end