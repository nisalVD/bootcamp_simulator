require 'audite'

def battle
    while
        player = Audite.new

        player.events.on(:complete) do
        end

        player.load('battle.mp3')
        player.toggle
        response = gets.chomp.downcase
        player.toggle
        return response
        break
        player.thread.join
    end
end

def start_music
    while
        player = Audite.new

        player.events.on(:complete) do
        end

        player.load('Guile Theme.mp3')
        player.toggle
        literal_response = gets.strip
        player.toggle
        return literal_response
        break
        player.thread.join
    end
end

def victory
    while
        player = Audite.new

        player.events.on(:complete) do
        end

        player.load('victory.mp3')
        player.toggle
        gets
        player.toggle
        break
        player.thread.join
    end
end