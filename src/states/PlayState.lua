PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.paddle = Paddle()
    self.paused = false
end

function PlayState:update(dt)
    
    if love.keyboard.wasPressed('space') then
        self.paused = not self.paused
        gSounds['pause']:play()
    end

    self.paddle:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event:quit()
    end
end

function PlayState:render()
    self.paddle:render()

    if self.paused then
        love.graphics.setFont(gFonts['large'])
        love.graphics.printf("PAUSED", 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, 'center')
    end
end