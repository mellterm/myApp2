require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Micropost.new.valid?
  end
end
