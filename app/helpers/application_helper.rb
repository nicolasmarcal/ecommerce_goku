module ApplicationHelper
  def message_kind(name)
    if name == :error
      "alert-danger"
    else
      "alert-success"
    end
  end

  def method_name
    
  end
end
