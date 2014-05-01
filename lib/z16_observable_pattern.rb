require_relative 'patterns/observable'

class TelescopeScheduler
  include Observable
  def initialize
    @observer_list = []
  end
  def addViewer(viewer)
    @observer_list << viewer
  end
end

#will result in hardly detectable runtime problems
## module instance var will only be accessed through module methods
## class instance var will only be access through class methods
class TSObserver
  def update
    puts "#{self.object_id} updated"
  end
end

obs1 = TSObserver.new
puts "Observer 1: #{obs1.object_id}"
obs2 = TSObserver.new
puts "Observer 2: #{obs2.object_id}"

ts = TelescopeScheduler.new
ts.addViewer(obs1)
ts.addObserver(obs2)
## the following calls will only access the module mixed in instance var 
ts.notify_observers
puts ts.observers