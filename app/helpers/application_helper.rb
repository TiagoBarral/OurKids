module ApplicationHelper
  def category_icon(category)
    case category
    when 'Education'
      return 'https://img.icons8.com/ios/30/000000/flying-motarboard.png'
    when 'Health'
      return 'https://img.icons8.com/ios/30/000000/stethoscope.png'
    when 'Fun'
      return 'https://img.icons8.com/ios/30/000000/crazy.png'
    when 'Vacation'
      return 'https://img.icons8.com/ios/30/000000/sunbathe.png'
    when 'Food'
      return 'https://img.icons8.com/ios/30/000000/food.png'
    when 'Sport'
      return 'https://img.icons8.com/ios/30/000000/trampoline-park.png'
    when 'Clothes'
      return 'https://img.icons8.com/ios/30/000000/clothes.png'
    when 'Others'
      return 'https://img.icons8.com/ios/30/000000/connection-status-off.png'
    end
  end
end
