class Banner
  def initialize(message, size = 0)
    @message = message
    @size = [@message.length, size].max
    @pad = [size - message.length, 0].max / 2
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-" + "-" * @size + "-+"
  end

  def empty_line
    "| " + " " * @size + " |"
  end

  def message_line
    "| " + " " * @pad + @message + " " * @pad + " |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 1)
puts banner