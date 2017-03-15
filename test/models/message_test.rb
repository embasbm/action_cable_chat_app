require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = users(:example).messages.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "should not be blank" do
    @message.content = " "
    assert !@message.valid?
  end

  test ".mentions Returns a list of users @mentioned in message content" do
    @message.content += ' @' + users(:example).username
    assert_not @message.mentions.empty?, [users(:example)]
  end
end
