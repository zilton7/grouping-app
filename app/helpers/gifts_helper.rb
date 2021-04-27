module GiftsHelper
  def pick_form
    if request.original_url.include?('groups')
      render 'group-form'
    else
      render 'form'
    end
  end

  def insert_gift_icon(obj, size = '50')
    if obj.groups[0]
      if obj.groups[0].icon != ''
        image_tag(obj.icon, size: size, alt: "#{obj.name} icon")
      else
        image_tag('https://via.placeholder.com/50', size: size, alt: "#{obj.name} icon")
      end
    else
      image_tag('https://via.placeholder.com/50', size: size, alt: 'un-groupped gift icon')
    end
  end
end
