class GiftsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @gift = @group.gifts.new
  end

  def create
    @group = Group.find(params[:group_id])
    @gift = @group.gifts.create(gift_params)
    @gift.author = @group.user

    if @gift.save
      puts 'hooray'
      redirect_to @gift
    else
      p @gift.errors.full_messages
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
