class TestsController < ApplicationController

  SAMPLES = 1_000

  def index
    tests
  end

  private

  def tests
    @tests ||= Test.order('RANDOM()').limit(SAMPLES)
  end
end
