class Character
    def initialize(name)
        @name = name       
    end
    attr_accessor :intellect, :persistence, :base_social, :social, 
    :coffee_response, :coding_skill

    def adjust_social(social_points)
        @social = self.base_social * (social_points / 10.0) + self.base_social
    end

    def adjust_coding_skill(coding_skill)
        if coding_skill > 0 
            @coding_skill = (self.coding_skill * coding_skill) / 10.0 + self.intellect
        elsif coding_skill < 0
            @coding_skill = self.coding_skill + coding_skill
        end
    end

    def coffee_drink
        original_stats = []
        original_stats << self.intellect
        @intellect = self.intellect * self.coffee_response
        original_stats = [] << self.persistence
        @persistence = self.persistence * self.coffee_response
        original_stats = [] << self.base_social
        @base_social = self.base_social * self.coffee_response
        @coffee_response = self.coffee_response - 1
        return original_stats
    end

    def coffee_crash(original_stats)
        @intellect = original_stats[0]
        @persistence = original_stats[1]
        @base_social = original_stats[2]
    end
end 

nathaniel = Character.new('Nathaniel')
nathaniel.intellect = 10.0
nathaniel.social = 10.0
nathaniel.coding_skill = 1.0
nathaniel.adjust_social(-5.0)
nathaniel.adjust_coding_skill(-5.0)
puts nathaniel.social
puts nathaniel.coding_skill