require 'noty/ask'

module Noty
  module UI
    module_function

    def choose(objects)
      return if objects.empty?

      if objects.one?
        puts objects.first.to_s(false)
        operations(objects.first)
      else

        objects.each_with_index do |object, index|
          puts "#{index + 1}. " + object.to_s(true)
        end

        choice = ask '-> (1..9) or else to exit: '

        if choice =~ /\A[1-9]\z/
          puts objects[choice.to_i - 1].to_s(false)
          operations(objects[choice.to_i - 1])
        end
      end
    end

    def operations(object)
      case ask '[E]dit [D]elete [O]pen [C]opy, Else to Quit: '
      when 'e'
        object.edit
      when 'd'
        object.delete
      when 'o'
        object.open
      when 'c'
        object.copy
      else
        exit 0
      end
    end
  end
end
