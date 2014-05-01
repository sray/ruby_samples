module Observable
  def observers
    @observers_list ||= []      
  end
  def addObserver(obj)
    observers << obj
  end
  
  def notify_observers
    observers.each {|o| o.update}
  end
end