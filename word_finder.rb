def word_finder(letters, size=letters.size, places=[], known=[])
  possibilities = letters.permutation(size).map(&:join)

  places&.each_with_index do |place, idx|
    possibilities.map { |word| word.insert(place - 1, known[idx]) }
  end

  possibilities
end

letters = %w[a r c] # available letters for the unknown
size = 3 # number of unknown letters
known = %w[o l e] # letters already known (must be in order)
places = [1, 5, 6] # position of known letters (index starting at 1)

possibilities = word_finder(letters, size, places, known)
num_possible = possibilities.size
message = num_possible == 1 ? 'possibility' : 'possibilities'
puts "#{num_possible} #{message}:"
puts possibilities
