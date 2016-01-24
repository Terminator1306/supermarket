class ShoppinglistsController < ApplicationController
  before_action :set_shoppinglist, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate, except: [:index, :show]

  # GET /shoppinglists
  # GET /shoppinglists.json
  def index
    @shoppinglists = Shoppinglist.where(manipulator_id:current_user.id)
  end

  # GET /shoppinglists/1
  # GET /shoppinglists/1.json
  def show
  	@i
  	@products=Product.all
    @shoppinglist = Shoppinglist.find(params[:id])
    @item=@shoppinglist.items.build
    @items=@shoppinglist.items
  end

  # GET /shoppinglists/new
  def new
  	@products=Product.all
    @shoppinglist = Shoppinglist.new
    @shoppinglist.time=Time.new
    @shoppinglist.total=0
    @shoppinglist.manipulator_type=Manipulator.find(current_user.id).m_type
    @shoppinglist.manipulator_id=current_user.id
    @shoppinglist.save
    redirect_to @shoppinglist
  end

  # GET /shoppinglists/1/edit
  def edit
  end

  # POST /shoppinglists
  # POST /shoppinglists.json
  def create
    @shoppinglist = Shoppinglist.new(shoppinglist_params)

    respond_to do |format|
      if @shoppinglist.save
        format.html { redirect_to @shoppinglist, notice: 'Shoppinglist was successfully created.' }
        format.json { render :show, status: :created, location: @shoppinglist }
      else
        format.html { render :new }
        format.json { render json: @shoppinglist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoppinglists/1
  # PATCH/PUT /shoppinglists/1.json
  def update
    respond_to do |format|
      if @shoppinglist.update(shoppinglist_params)
        format.html { redirect_to @shoppinglist, notice: 'Shoppinglist was successfully updated.' }
        format.json { render :show, status: :ok, location: @shoppinglist }
      else
        format.html { render :edit }
        format.json { render json: @shoppinglist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoppinglists/1
  # DELETE /shoppinglists/1.json
  def destroy
    unless @shoppinglist.items.nil?
    	@shoppinglist.items.each do |item|
    		p=Product.find(item.product_id)
    		if(current_user.m_type==0)
    		  p.quantity-=item.quantity
    		else
      		  p.quantity+=item.quantity
    		end
    		p.save
    		item.destroy
    	end
    end
    @shoppinglist.destroy
    respond_to do |format|
      format.html { redirect_to shoppinglists_url, notice: 'Shoppinglist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoppinglist
      @shoppinglist = Shoppinglist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shoppinglist_params
      params.require(:shoppinglist).permit(:manipulator_type, :total, :time)
    end

    def authenticate
      redirect_to login_users_url, alert: 'Must login!' unless current_user
	end 
end
