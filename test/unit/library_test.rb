require 'test_helper'

class LibraryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Library.new.valid?
  end
end
