class Character
    def initialize(name)
        @name = name       
    end
    attr_accessor :intellect, :persistence, :social, :coffee_response,
    :coding_skill

    def adjust_social(social_points)
        @social = (self.social * social_points) / 10
    end

    def adjust_coding_skill(coding_skill)
        @coding_skill = (self.coding_skill * coding_skill) /10 + intellect
    end

end