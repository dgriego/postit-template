module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def format_date(date)
    # 05/20/2014 2:44pm EDT
    # %l hour of the day blank padded
    date.strftime('%m/%d/%Y %l:%M%P %Z')
  end
end
