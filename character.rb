require 'colorize'

class Character
    def initialize(name)
        @name = name      
    end
    attr_accessor :name, :intellect, :persistence, :base_social, :social, 
    :coffee_response, :coding_skill

    def adjust_social(social_points)
        if social_points > 0
            @social = @base_social * (social_points / 20.0) + @social
            puts "\nYou gained #{social_points} social points!".green
        elsif social_points < 0
            @social = @social + social_points
            puts "\nYou lost #{social_points} social points... Not going to have any friends at this rate...".green
        end
        puts "\nYour social score is now #{@social}. Remember to balance social and coding points!".green
    end

    def adjust_coding_skill(coding_skill)
        if coding_skill > 0 
            @coding_skill = @intellect * (coding_skill / 20.0) + @coding_skill
            "\nYou gained #{coding_skill} coding points!".green
        elsif coding_skill < 0 
            @coding_skill = @coding_skill + coding_skill
            puts "\nYou lost #{coding_skill} coding points... Get back to work!".green
        end
        puts "\nYour coding score is now #{@coding_skill}. Remember to balance social and coding points!".green
    end

    def coffee_drink
        original_stats = []
        original_stats[0] = @intellect
        @intellect = @intellect * @coffee_response
        original_stats[1] = @persistence
        @persistence = @persistence * @coffee_response
        original_stats[2] = @base_social
        @base_social = @base_social * @coffee_response
        puts "\nYour intellect, persistence and base social stats have all been boosted by #{@coffee_response}!".green
        @coffee_response = @coffee_response - 1
        return original_stats
    end

    def coffee_crash(original_stats)
        @intellect = original_stats[0]
        @persistence = original_stats[1]
        @base_social = original_stats[2]
        original_stats = nil
    end

    def findscore
        social = @social
        coding_skill = @coding_skill
        initial_score = social - coding_skill
        final_score = social + coding_skill - initial_score.abs
        return final_score
    end
end 