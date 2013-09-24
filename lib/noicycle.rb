require "noicycle/version"

module Noicycle
  class Noicycle
    def tapes(ref_date, nb_tapes = 3, cur_date = nil, weekly = false, weekly_ref_day = 0)
      result = Hash.new
      function = function_for_nb_of_tapes(nb_tapes)
      Date.today

      # Change the starting date if we're weekly so that it coincides with the desired weekly_ref_day
      l_date = cur_date
      l_date ||= Date.today
      if weekly
        while l_date.wday != weekly_ref_day do
          l_date = l_date - 1
        end
      end

      nb_of_tapes_found = 0
      nb_of_days = (l_date - ref_date).to_i
      nb_of_days = (nb_of_days / 7).to_i if weekly
      for i in 0..nb_of_days
        i_date = (weekly ? (l_date - 7*i) : (l_date - i))
        i_tape = tape_for(i_date, ref_date, function, weekly)
        if result[i_tape].nil?
          result[i_tape] = i_date
          nb_of_tapes_found = nb_of_tapes_found + 1
          if nb_of_tapes_found == 7
            return result
          end
        end
      end

      result
    end

    private

    def pretty_function(function)
      function.sort.map do |key,value|
        puts "function(#{key}) = #{value}"
      end
    end

    def function_for_nb_of_tapes(nb_of_tapes)
      raise "There must be at least 2 tapes" unless nb_of_tapes > 1

      # Fill the function
      elements = 2 ** (nb_of_tapes - 1)
      function = Hash.new
      for i in 1..nb_of_tapes
        index = 2 ** (i - 1)
        while (index <= elements) do
          function[index] = i
          index = index + 2 ** i
        end
      end

      # Create 0 value with last value:
      # - This will allow the first backup (ie index 0) to be available the longest possible time
      # - Will make further modulo operations much easier to achieve
      function[0] = function[elements]
      function.delete(elements)
      function
    end

    def tape_for(date, ref_date, function, weekly = false)
      nb_of_days = (date - ref_date).to_i
      nb_of_days = (nb_of_days / 7).to_i if weekly
      modulo = nb_of_days % function.length
      function[modulo]
    end
  end
end
