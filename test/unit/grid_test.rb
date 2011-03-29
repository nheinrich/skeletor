require 'test_helper'

class GridTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Grid.new.valid?
  end
end
