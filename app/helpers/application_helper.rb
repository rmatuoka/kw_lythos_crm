module ApplicationHelper 
  
  def boolean_translate(boolean)
    if boolean
      return "Sim"
    else
      return "Não"
    end
  end
end
