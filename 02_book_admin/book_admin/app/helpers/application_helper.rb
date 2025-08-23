module ApplicationHelper
  def to_lower(str)
    str.tr("A-Z", "a-z")
  end
end
