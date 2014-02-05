require 'test_helper'

class FinishTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Finish.new.valid?
  end
end
