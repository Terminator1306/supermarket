class ManipulatorsController < ApplicationController
  before_action :set_manipulator, only: [:show, :edit, :update, :destroy]

  # GET /manipulators
  # GET /manipulators.json
  def index
    @manipulators = Manipulator.all
  end

  # GET /manipulators/1
  # GET /manipulators/1.json
  def show
  end

  # GET /manipulators/new
  def new
    @manipulator = Manipulator.new
  end

  def login
  end

  def do_login
  	puts  params[:username]
  	puts  params[:password]
    user = Manipulator.where(m_name: params[:m_name], password: params[:password]).first
    if user
      session[:current_userid] = user.id
      redirect_to shoppinglists_url, notice: 'User login successfully.'
    else
      redirect_to login_manipulators_url, alert: 'Wrong username or password!'
    end
  end

  def logout
    session.delete(:current_userid)
    redirect_to login_manipulators_url, alert: 'User logout successfully!'
  end


  # GET /manipulators/1/edit
  def edit
  end

  # POST /manipulators
  # POST /manipulators.json
  def create
    @manipulator = Manipulator.new(manipulator_params)

    respond_to do |format|
      if @manipulator.save
        format.html { redirect_to @manipulator, notice: 'Manipulator was successfully created.' }
        format.json { render :show, status: :created, location: @manipulator }
      else
        format.html { render :new }
        format.json { render json: @manipulator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manipulators/1
  # PATCH/PUT /manipulators/1.json
  def update
    respond_to do |format|
      if @manipulator.update(manipulator_params)
        format.html { redirect_to @manipulator, notice: 'Manipulator was successfully updated.' }
        format.json { render :show, status: :ok, location: @manipulator }
      else
        format.html { render :edit }
        format.json { render json: @manipulator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manipulators/1
  # DELETE /manipulators/1.json
  def destroy
    @manipulator.destroy
    respond_to do |format|
      format.html { redirect_to manipulators_url, notice: 'Manipulator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manipulator
      @manipulator = Manipulator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manipulator_params
      params.require(:manipulator).permit(:m_name, :password, :m_type)
    end
end
