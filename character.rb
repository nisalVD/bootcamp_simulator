class Character
    def initialize(name)
        @name = name
        @original_stats = []
    end
    attr_accessor :name, :intellect, :persistence, :base_social, :social, 
    :coffee_response, :coding_skill, :coffee_used, :original_stats, :sleep

    def adjust_social(social_points)
        if social_points > 0
            @social = @base_social * (social_points / 20.0) + @social
            puts "\nYou gained #{@base_social * (social_points / 20.0)} social points!".green
        elsif social_points < 0
            @social = @social + social_points
            puts "\nYou lost #{social_points} social points... Not going to have any friends at this rate...".green
        end
    end

    def adjust_coding_skill(coding_skill)
        if coding_skill > 0 
            @coding_skill = @intellect * (coding_skill / 20.0) + @coding_skill
            puts "\nYou gained #{@intellect * (coding_skill / 20.0)} coding points!".green
        elsif coding_skill < 0 
            @coding_skill = @coding_skill + coding_skill
            puts "\nYou lost #{coding_skill} coding points... Get back to work!".green
        end
    end

    def coffee_drink
        timelord = "
        .   *        .       .
        *      -0-
           .                .  *       - )-
        .      *       o       .       *
  o                |
            .     -O-
 .                 |        *      .     -0-
        *  o     .    '       *      .        o
               .         .        |      *
    *             *              -O-          .
          .             *         |     ,
                 .           o
         .---.
   =   _/__~0_\_     .  *            o       '
  = = (_________)             .
                  .                        *
        *               - ) -       *
               .               .
        ".cyan
        negative_response = "
         _____
        /ZZZZZ)
        |____/
        \\_____\\
        |ZZZZZ|___
      .'(\\ @ @)_. 
        /;   > )-
        \\; `--'
          \\,'/
       ___|;|___
      >xXX>O<XXx<
        ".cyan
        @intellect = @intellect * @coffee_response / 2.0
        @base_social = @base_social * @coffee_response / 2.0
        puts "\nYour intellect, and base social stats have both been multiplied by #{@coffee_response / 2.0}!".green
        puts "\n
        )))
        (((
      +-----+
      |     |]
      `-----'   
    ___________
    `---------'
        ".cyan
        @coffee_response = @coffee_response - 1
        if coffee_response == 2
            @sleep = -5
            system 'clear'
            puts "You have drank too much coffee and now have the ability to see through time.".green
            gets
            puts timelord
            puts "\nUnfortunately you are now immune to coffee and are having trouble sleeping.".green
        elsif coffee_response < 2
            @sleep = -10
            puts "\n...Oops!Your coffee response is less than 0 and is now having a detrimental effect... You coffee addict".red
            puts negative_response
        end
        @coffee_used = true
    end

    def coffee_crash
        @intellect = @original_stats[0]
        @base_social = @original_stats[1]
        @coffee_used = false
    end

    def findscore
        social = @social
        coding_skill = @coding_skill
        initial_score = social - coding_skill
        final_score = social + coding_skill - initial_score.abs
        return final_score
    end

    def original_stats_array
        original_intellect = @intellect
        original_base_social = @base_social
        @original_stats = [original_intellect, original_base_social]
    end

end 