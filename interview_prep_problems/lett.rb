def scramble_words(str)
  words = str.split

  words.map! do |word|
    punct = []
    letters = []
    nils = []

    word.chars.each do |char|
      if char =~ /[a-z]/
        letters << char
        punct << nil
      else
        punct << char
        letters << nil
      end
    end

    letters.each_with_index do |char, idx|
      nils << idx if char == nil
    end

    letters.compact!
    first = letters.shift
    last = letters.pop

    letters.sort_by!(&:downcase)

    letters = [first] + letters + [last]

    nils.each do |idx|
      result = []

      if !letters[0...idx].empty?
        result << letters[0...idx]
      end

      result << nil

      if !letters[idx...letters.size].nil? && !letters[idx...letters.size].empty?
        result << letters[idx...letters.size]
      end

      letters = result
      end

    letters.flatten.zip(punct).flatten.compact.join
  end.join(' ')
end
