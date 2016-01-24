class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @products=Product.all
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @shoppinglist= Shoppinglist.find(@item.shoppinglist_id)
    @products=Product.all
  end

  # POST /items
  # POST /items.json
  def create
    @shoppinglist = Shoppinglist.find(params[:shoppinglist_id])
    @item = @shoppinglist.items.create(item_params)
    p=Product.find(@item.product_id)
       if(current_user.m_type==0)
          p.quantity+=@item.quantity
        else
          p.quantity-=@item.quantity
        end
    @shoppinglist.total+=@item.quantity*p.price
    @shoppinglist.save
    p.save
    redirect_to shoppinglist_path(@shoppinglist)
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    shoppinglist=Shoppinglist.find(@item.shoppinglist_id)
    if(current_user.m_type==0)
      @p.quantity-=@item.quantity
    else
      @p.quantity+=@item.quantity
    end
    shoppinglist.total-=@item.quantity*@p.price
    shoppinglist.save
    respond_to do |format|
      if @item.update(item_params)
        if(current_user.m_type==0)
          @p.quantity+=@item.quantity
        else
          @p.quantity-=@item.quantity
        end
        shoppinglist.total+=@item.quantity*@p.price
        shoppinglist.save
        @p.save
        format.html { redirect_to Shoppinglist.find(@item.shoppinglist_id), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    if(current_user.m_type==0)
      @p.quantity-=@item.quantity
    else
      @p.quantity+=@item.quantity
    end
    @shoppinglist= Shoppinglist.find(@item.shoppinglist_id)
    @shoppinglist.total-=@item.quantity*@p.price
    @shoppinglist.save
    @p.save
    @item.destroy
    respond_to do |format|
      format.html { redirect_to Shoppinglist.find(@item.shoppinglist_id), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
      @p=Product.find(@item.product_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:product_id, :quantity)
    end
end
