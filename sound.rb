require 'audite'

def battle
    while
        player = Audite.new

        player.events.on(:complete) do
        end

        player.load('battle.mp3')
        player.toggle
        gets
        player.toggle
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
        gets
        player.toggle
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