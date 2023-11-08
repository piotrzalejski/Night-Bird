PauseState = Class{__includes = BaseState}

function PauseState:init()
    self.gameState = {}
    self.bird = Bird()
end

function PauseState:enter(params)
    self.gameState = params
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', self.gameState)
    end
end

function PauseState:render()
    for k, pair in pairs(self.gameState.pipes) do
        pair:render()
    end

    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.gameState.score), 8, 8)

    self.bird.x = self.gameState.birdX
    self.bird.y = self.gameState.birdY
    self.bird:render()

    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Paused', 0, WINDOW.VH / 2 - 14, WINDOW.VW, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press P to Unpause', 0, WINDOW.VH / 2 + 14, WINDOW.VW, 'center')

end