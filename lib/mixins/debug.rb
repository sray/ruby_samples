module Debug
  def whoAmI?
    "#{self.class.name} (id: #{self.object_id}): #{self.name}"
  end
end