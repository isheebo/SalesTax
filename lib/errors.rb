class Error < StandardError
  def message
    "error"
  end
end

class InvalidLineItemError < Error
  def message
    "item is invalid, cannot be an empty string"
  end
end

class EmptyBasketError < Error
  def message
    "the given basket is empty, please add some items"
  end
end
