module GroupsHelper
  def insert_icon(obj, size = '50')
    if obj
      if obj.icon != ''
        image_tag(obj.icon, size: size, alt: "#{obj.name} icon")
      else
        image_tag('https://via.placeholder.com/50', size: size, alt: "#{obj.name} icon")
      end
    else
      image_tag('https://via.placeholder.com/50', size: size, alt: 'un-groupped gift icon')
    end
  end
end
