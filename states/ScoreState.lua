ScoreState = Class{__includes = BaseState}

function ScoreState:init()
    self.bronze = love.graphics.newImage('assets/bronze-medal.png')
    self.silver = love.graphics.newImage('assets/silver-medal.png')
    self.gold = love.graphics.newImage('assets/gold-medal.png')
    self.x = WINDOW.VW / 2 - 10.7
    self.y = WINDOW.VH / 2
end
--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, WINDOW.VW, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, WINDOW.VW, 'center')

    local medal
    local medalimg
    if self.score > 0 and self.score < 10  then
        medal = 'Bronze'
        medalimg = self.bronze
    elseif self.score >= 10 and self.score < 20 then
        medal = 'Silver'
        medalimg = self.silver
    elseif self.score > 20 then
        medal = 'Gold'
        medalimg = self.gold
    end
    if medalimg ~= nil then
        love.graphics.draw(medalimg, self.x, self.y, 0 , .01, .01)
        love.graphics.printf('You have earned a ' .. medal .. ' medal!',0, 120, WINDOW.VW, 'center')
    end


    love.graphics.printf('Press Enter to Play Again!', 0, 180, WINDOW.VW, 'center')
end