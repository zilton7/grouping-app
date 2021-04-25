class GiftsController < ApplicationController
  def index
    if params['ungrouped']
      @gifts = Gift.where(group: nil)
    else
      @gifts = Gift.where(author: current_user)
    end
  end

  def new
    if request.original_url.include?('groups')
      @group = Group.find(params[:group_id])
      @gift = @group.gifts.new
    else
      @gift = Gift.new
    end
  end

  def create
    if request.original_url.include?('groups')
      @group = Group.find(params[:group_id])
      @gift = @group.gifts.create(gift_params)
    else
      @gift = Gift.create(gift_params)
    end
    @gift.author = current_user

    if @gift.save
      flash[:success] = 'Gift saved!'
      if request.original_url.include?('groups')
        redirect_to @group 
      else 
        redirect_to @gift
      end
    else
      render :new
    end
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:name, :amount, :author, :group)
  end
end
