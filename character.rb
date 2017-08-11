class Character
    def initialize(name)
        @name = name       
    end
    attr_accessor :intellect, :persistence, :base_social, :social, 
    :coffee_response, :coding_skill

    def adjust_social(social_points)
        if social_points > 0
            @social = self.base_social * (social_points / 20.0) + self.social
            puts "You gained #{social_points} social points!"
        else 
            @social = self.social + social_points
            puts "You lost #{social_points} social points... Not going to have any
            friends at this rate..."
        end
        puts "Your social score is now #{self.social}. Remember to balance social and coding points!"
    end

    def adjust_coding_skill(coding_skill)
        if coding_skill > 0 
            @coding_skill = self.intellect * (coding_skill / 20.0) + self.coding_skill
            "You gained #{coding_skill} coding points!"
        else 
            @coding_skill = self.coding_skill + coding_skill
            puts "You lost #{coding_skill} coding points... Get back to work!"
        end
        puts "Your coding score is now #{self.coding_skill}. Remember to balance social and coding points!"
    end

    def coffee_drink
        original_stats = []
        original_stats[0] = self.intellect
        @intellect = self.intellect * self.coffee_response
        original_stats[1] = self.persistence
        @persistence = self.persistence * self.coffee_response
        original_stats[2] = self.base_social
        @base_social = self.base_social * self.coffee_response
        puts "Your intellect, persistence and base social stats have all been boosted by #{self.coffee_response}!"
        @coffee_response = self.coffee_response - 1
        return original_stats
    end

    def coffee_crash(original_stats)
        @intellect = original_stats[0]
        @persistence = original_stats[1]
        @base_social = original_stats[2]
        original_stats = nil
    end

    def findscore
        social = self.social
        coding_skill = self.coding_skill
        initial_score = social - coding_skill
        final_score = social + coding_skill - initial_score.abs
        return final_score
    end
end 

# nathaniel = Character.new('Nathaniel')
# nathaniel.intellect = 10.0
# nathaniel.social = 10.0
# nathaniel.base_social = 1.0
# nathaniel.coding_skill = 1.0
# nathaniel.adjust_social(-5.0)
# nathaniel.adjust_coding_skill(-5.0)
# nathaniel.coffee_response = 3
# nathaniel.persistence = 2
# puts nathaniel.findscore
# original_array = nathaniel.coffee_drink
# original_array = nathaniel.coffee_crash(original_array)