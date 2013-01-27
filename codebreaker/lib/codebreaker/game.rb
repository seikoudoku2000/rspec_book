module Codebreaker
	class Game
		def initialize(output)
			@output = output	
		end

		def start(secret)
			@output.puts 'Welcome to Codebreaker!'
			@output.puts 'Enter guess:'
			@secret = secret
		end

		def guess(guess)
			marker = Marker.new(@secret, guess)
			@output.puts '+' * marker.extra_match_count + '-' * marker.number_match_count
		end

	end


	class Marker
		def initialize(secret, guess)
			@secret, @guess = secret, guess
		end

		def extra_match_count
			extra_match_count = 0
			(0..3).each do |index|
				if extra_match?(index)
					extra_match_count += 1
				end
			end
			extra_match_count
		end

		def number_match_count
			number_match_count = 0
			(0..3).each do |index|
				if number_match?(index)
					number_match_count += 1
				end
			end
			number_match_count
		end

		def extra_match?( index)
			@guess[index] == @secret[index]
		end

		def number_match?( index)
			@secret.include?(@guess[index]) && !extra_match?(index)
		end

	end
end

