module Ultimate
  def self.call(_num)
    "No more bottles of beer on the wall, no more bottles of beer.\n\
Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

module Penultimate
  def self.call(_num)
    "1 bottle of beer on the wall, 1 bottle of beer.\n\
Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

module Antepenultimate
  def self.call(_num)
    "2 bottles of beer on the wall, 2 bottles of beer.\n\
Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

module Default
  def self.call(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n\
Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
  end
end

class Bottles
  VERSES = {
    0 => Ultimate,
    1 => Penultimate,
    2 => Antepenultimate
  }.tap { |h| h.default = Default }

  attr_reader :song_length
  def initialize
    # @verses = {
    #   0 => Ultimate,
    #   1 => Penultimate,
    #   2 => Antepenultimate
    # }
    # @verses.default_proc = proc { |hash, key| hash[key] = Default }
    @song_length = [99, 0]
  end

  def verse(num)
    VERSES[num].call(num)
  end

  def verses(start, finish)
    start
      .downto(finish)
      .each_with_object([]) { |num, acc| acc << VERSES[num].call(num) }
      .join "\n"
  end

  def song
    verses(*song_length)
  end
end
