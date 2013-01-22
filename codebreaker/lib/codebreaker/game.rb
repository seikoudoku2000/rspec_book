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
			mark = ''
			(0..3).each do |index|
				if extra_match?(guess, index)
					mark << '+'
				elsif number_match?(guess, index)
					mark << '-'
				end
			end
			@output.puts mark
		end

		def extra_match?(guess, index)
			guess[index] == @secret[index]
		end

		def number_match?(guess, index)
			@secret.include?(guess[index]) && !extra_match?(guess, index)
		end
	end
end

