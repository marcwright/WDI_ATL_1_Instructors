require 'pry'
require 'aasm'

class Job
  include AASM

  attr_accessor :aasm_state

  aasm do
    state :sleeping, :initial => true
    state :running
    state :cleaning

    event :run do
      transitions :from => :sleeping, :to => :running
    end

    event :clean do
      transitions :from => :running, :to => :cleaning
    end

    event :sleep do
      transitions :from => :running, :to => :sleeping, :guard => :cleaning_needed?
    end
  end

  def cleaning_needed?
    puts "checking if it needs cleaning..."
    false
  end

end

binding.pry
