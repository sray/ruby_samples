class Log
  private_class_method :new
  @@logger = nil

  def Log.create
    @@logger = new unless @@logger
    @@logger
  end

end

Log.create.object_id
Log.create.object_id
