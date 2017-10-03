class ListsController < ApplicationController

  def index
    # why an instance variable? because it can permeate through controller to the erb views
    @list = List.new
    @lists = List.all
    # render 'lists/index.html.erb'
  end

  def show
    # I need to load the list
    # params have all the data passed on by the user
    @list = List.find(params[:id])
    # @item = @list.items.build #build method provided by has_many association
    @item = Item.new
  end

  # We don't have a #new action because it is provided by the #index action

  def create
    # why can't we use @list in #index action? they are completely different objects, entirely new request
    # need to instantiate a new @list
    @list = List.new(list_params)
    if @list.save
      # with redirects, should use full url instead of list_path
      redirect_to list_url(@list)
    else
      @lists = List.all
      # render does not create another request
      render :index
    end
  end

  private
    def list_params # strong parameters
      params.require(:list).permit(:name)
    end

end
