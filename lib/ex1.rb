class Bottles
  def verse(number)
    if number == 2
      answer_bottles = "#{number - 1} bottle"
      number_bottles = "#{number} bottles"
      one = "one"
      "#{number_bottles} of beer on the wall, #{number_bottles} of beer.\n" +
      "Take #{one} down and pass it around, " +
      "#{answer_bottles} of beer on the wall.\n"
    elsif number == 1
      answer_bottles = "no more bottles"
      number_bottles = "1 bottle"
      one = "it"
      "#{number_bottles} of beer on the wall, #{number_bottles} of beer.\n" +
      "Take #{one} down and pass it around, " +
      "#{answer_bottles} of beer on the wall.\n"
    elsif number == 0
      nmcaps = "No more bottles"
      nmlow = "no more bottles"
      answer_bottles = "99 bottles"
      "#{nmcaps} of beer on the wall, #{nmlow} of beer.\n" +
      "Go to the store and buy some more, " +
      "#{answer_bottles} of beer on the wall.\n"
    else
      answer_bottles = "#{number - 1} bottles"
      number_bottles = "#{number} bottles"
      one = "one"
      "#{number_bottles} of beer on the wall, #{number_bottles} of beer.\n" +
      "Take #{one} down and pass it around, " +
      "#{answer_bottles} of beer on the wall.\n"
    end
  end

  def verses(start, finish)
    start.downto(finish).collect do |number|
      verse(number)
    end.join("\n")
  end

  def song
    verses(99, 0)
  end
end