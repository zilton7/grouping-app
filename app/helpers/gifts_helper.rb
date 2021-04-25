module GiftsHelper
  def pick_form
    if request.original_url.include?('groups')
      render 'group-form'
    else
      render 'form'
    end
  end
end
