class TestsController < ApplicationController

  def index
    tests
  end

  private

  def tests
    @tests ||= Test.all.sample(1000)
  end

end
