require 'test_helper'

class DialectTest < ActiveSupport::TestCase
  def setup
    @dialect = Dialect.new(name: 'Ali G')
  end

  test "should be valid" do
    assert @dialect.valid?, @dialect.errors.full_messages
  end

  test "name should be present" do
    @dialect.name = ""
    assert_not @dialect.valid?
  end

  test "name should be unique" do
    duplicate_dialect = @dialect.dup
    duplicate_dialect.name = @dialect.name.upcase
    @dialect.save
    assert_not duplicate_dialect.valid?
  end

end
