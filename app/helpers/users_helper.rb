module UsersHelper
  def insert_avatar(obj, size = '50')
    p obj
    if obj.avatar
      insert_avatar(obj.avatar, size: size, alt: "#{obj.name} icon")
    else
      insert_avatar('https://i.ibb.co/X254Sr0/user-silhouette-icon.png', size: size, alt: "#{obj.name} icon")
    end
  end
end
