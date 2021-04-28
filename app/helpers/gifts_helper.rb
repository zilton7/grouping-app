module GiftsHelper
  def pick_form
    if request.original_url.include?('groups')
      render 'group-form'
    else
      render 'form'
    end
  end

  def insert_gift_icon(obj, size = '50')
    if obj.groups.first
      if obj.groups.first.icon != ''
        image_tag(obj.groups.first.icon, size: size, alt: "#{obj.name} icon")
      else
        image_tag('https://via.placeholder.com/50', size: size, alt: "#{obj.name} icon")
      end
    else
      image_tag('https://via.placeholder.com/50', size: size, alt: 'un-groupped gift icon')
    end
  end

  def gifts_html_template(obj)
    "<a href='/gifts/#{obj.id}'>
    <div class='list-item'>
    #{insert_gift_icon(obj)}
        <div class='list-text'>
            <p class='list-name'>#{obj.name}</p>
            <p class='list-date'>#{obj.created_at}</p>
        </div>
        <p class='price'>Price: $#{obj.amount}</p>
    </div>
    </a>"
  end

  def generate_gifts(gifts)
    html_values = ''
    gifts.each do |g|
      html_values << gifts_html_template(g)
    end
    html_values.html_safe
  end
end
