class Line
  attr_reader :content
  def initialize
    @content = content
  end
  def to_s
    content.call
  end
end

class Verse
  def initialize(lines)
    @lines = lines
  end

  def to_s
    lines.map(&:to_s).join
  end
end

class Bottles
  def verse(num)
    # lines.map {|line| self.public_send(line, num) }.join
    verses[num].map { |verse| verse.call(num) }
  end

  def lines
    [:line1,:line2]
  end

  def line1(num)
    "#{amount_of_beer_on_wall(num)}, #{amount_of_beer(num).downcase}.\n"
  end

  def line2(num)
    "#{action(num)}, #{amount_of_beer_on_wall(num-1).downcase}.\n"
  end

  def amount_of_beer_on_wall(num)
    %(#{amount_of_beer(num)} on the wall)
  end

  def amount_of_beer(num)
    %(#{num == 0 ? 'No more' : num } #{num == 1 ? 'bottle' : 'bottles' } of beer)
  end

  def action(num)
    return "Go to the store and buy some more" if num  == 0
    "Take #{num == 1 ? 'it' : 'one' } down and pass it around"
  end
end
