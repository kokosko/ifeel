class String
  def valid_brackets?
    return true if self.empty?

    new = self.gsub(/<>|\{\}|\[\]|\(\)/, '')
    return false if new == self

    new.valid_brackets?
  end
end