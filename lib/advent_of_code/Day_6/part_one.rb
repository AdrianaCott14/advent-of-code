# frozen_string_literal: true

require_relative "../version"

module AdventOfCode
  class PartOne
    def self.run
      new.run
    end

    def run
      # puts "hello world"
      get_input
      calc_num_passed_for_each_race
      calc_total_passed_races
    end

    def get_input()
      # read input
      file_data = IO.readlines("input.txt", chomp: true)
      time_data = file_data[0].split(" ")
      distance_data = file_data[1].split(" ")
      time_data.shift
      distance_data.shift
      @time_data = time_data.map(&:to_i)
      @distance_data = distance_data.map(&:to_i)
    end

    def calc_num_passed_for_each_race()
      @total_races_passed = []
      # look at one race at a time
      for race in 0..@time_data.length - 1
        passed_races = 0
        # loop through possible times (race_time)
        for i in 0..@time_data[race]
          # find out race distance achieved
          remaining_time = @time_data[race] - i
          dist_achieved = i * remaining_time
          # compare distance achieved to record
          if dist_achieved > @distance_data[race]
            passed_races = passed_races + 1
          end 
        end
        # increment counter if achieved was farther than record
        @total_races_passed << passed_races
      end
    end

    def calc_total_passed_races
      result = @total_races_passed.reduce(:*)
      puts result
    end
  end
end

AdventOfCode::PartOne.run
