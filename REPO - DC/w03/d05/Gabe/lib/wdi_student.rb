require 'pry'

class Student
    attr_accessor :name, :knowledge, :energy
        def initialize name, knowledge, energy
            @name = name
            @knowledge = 0
            @energy = 100
        end

        def type_code
          old_knowledge_value = @knowledge
          new_knowledge_value = old_knowledge_value + 5
          @knowledge = new_knowledge_value
        end

end # Student
