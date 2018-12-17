module ApplicationHelper
  def category_icon(category)
    case category
    when 'EDUCATION'
      return 'https://img.icons8.com/ios/30/000000/flying-motarboard.png'
    when 'HEALTH'
      return 'https://img.icons8.com/ios/30/000000/stethoscope.png'
    when 'FUN'
      return 'https://img.icons8.com/ios/30/000000/crazy.png'
    when 'VACATION'
      return 'https://img.icons8.com/ios/30/000000/sunbathe.png'
    when 'FOOD'
      return 'https://img.icons8.com/ios/30/000000/food.png'
    when 'SPORT'
      return 'https://img.icons8.com/ios/30/000000/trampoline-park.png'
    when 'CLOTHES'
      return 'https://img.icons8.com/ios/30/000000/clothes.png'
    when 'OTHERS'
      return 'https://img.icons8.com/ios/30/000000/connection-status-off.png'
    end
  end
end
