module Luhn
  REGEX = /\A[+-]?\d+(\.[\d]+)?\z/

  def self.valid? str
    return false if str.length <= 1

    if REGEX.match(str)
      # TODO
    else
      false
    end
  end
end
