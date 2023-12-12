# frozen_string_literal: true

require_relative "../version"

module AdventOfCode
    class PartOne
        def self.run
            new.run
        end

        def run
        #   puts "hello world"
            get_input
            compare_nums
        end

        def get_input()
            # read input
            input_text = File.read("input.txt")
            cards_data = input_text.split("\n")

            winning_nums_data = []
            my_nums_data = []
            @winning_nums = []
            @my_nums = []

            for card in 0..cards_data.length-1
                cards_arr = cards_data[card].split("|")
                winning_nums_data << cards_arr[0]
                my_nums_data << cards_arr[1]
            end

            for card in 0..winning_nums_data.length - 1
                @winning_nums << winning_nums_data[card].split(" ")
                @winning_nums[card].shift()
                @winning_nums[card].shift()
            end

            for card in 0..my_nums_data.length - 1
                @my_nums << my_nums_data[card].split(" ")
            end

            # puts "Winning: #{winning_nums.inspect}"
            # puts "My: #{my_nums.inspect}"
        end

        def compare_nums()
            running_total = 0

            for card in 0..@winning_nums.length-1
                num_matches = (@winning_nums[card] & @my_nums[card]).count
                if num_matches > 0
                    card_total = 2**(num_matches-1)
                else 
                    card_total = 0
                end
                running_total += card_total
            end
            puts running_total
        end
    end
end

AdventOfCode::PartOne.run