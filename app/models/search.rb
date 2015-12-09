module Search

  def search(param, term)
    where("#{param} LIKE ?", "%#{term}%")
  end

end
