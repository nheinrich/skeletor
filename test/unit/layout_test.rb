require 'test_helper'

class LayoutTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Layout.new.valid?
  end
end
