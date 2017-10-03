class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    # this item is already associated with a list via URL
    # raise @list.inspect #finding the parent
    @item = @list.items.build(item_params)
    if @item.save
      redirect_to list_path(@list)
    else
      render "lists/show"
    end
  end

  # PATCH - /lists/:list_id/items/:id
  def update
    # raise params.inspect #the data the form submitted to use that data to update the item described in the URL
    @item = Item.find(params[:id])
    @item.update(item_params) # add :status to strong params and clean up below 2 lines of code into this 1 line
    # @item.status = params[:item][:status] #0,1
    # @item.save

    redirect_to list_path(@item.list)
  end

  private
    def item_params
      params.require(:item).permit(:description, :status)
    end
end
