# frozen_string_literal: true

# A simple Dog class for rspec demonstration purposes
class Dog
  def initialize(hunger_level: 0)
    @hunger_level = hunger_level
  end

  def bark
    'woof!'
  end

  def feed
    @hunger_level = 0
  end

  def hungry?
    @hunger_level > 5
  end
end
