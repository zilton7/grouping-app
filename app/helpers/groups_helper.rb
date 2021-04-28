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

  def groups_html_template(obj)
    "<a href='/groups/#{obj.id}'>
      <div class='list-item'>
      #{insert_icon(obj)}
      <div class='list-text'>
              <p class='list-name'>#{obj.name}</p>
              <p class='list-date'>#{obj.created_at}</p>
          </div>
          <p class='price'>Gifts: #{obj.gifts.count}</p>
      </div>
    </a>"
  end

  def generate_groups(groups)
    html_values = ''
    groups.each do |g|
      html_values << groups_html_template(g)
    end
    html_values.html_safe
  end
end
