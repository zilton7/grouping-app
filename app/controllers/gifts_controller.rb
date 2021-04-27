# rubocop:disable Layout/LineLength
class GiftsController < ApplicationController
  def index
    @gifts = if params['ungrouped']
               Gift.where(author: current_user).includes(:gifts_groups).where(gifts_groups: { id: nil }).includes([:groups])
             else
               Gift.where(author: current_user).includes(:gifts_groups).where.not(gifts_groups: { id: nil })
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
      @gift = Gift.create(gift_params)
      @gift.groups << @group

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
# rubocop:enable Layout/LineLength
