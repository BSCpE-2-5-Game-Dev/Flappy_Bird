--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
medals = {
    ['bronze'] = love.graphics.newImage('bronze_medal.png'),
    ['silver'] = love.graphics.newImage('silver_medal.png'),
    ['gold'] = love.graphics.newImage('gold_medal.png')
}
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
    love.graphics.printf('Oof! You hit the pipe!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    
    local bronze_score = 10
    local silver_score = 20
    local gold_score = 50
    
    if self.score >= bronze_score and self.score < silver_score then
        love.graphics.printf('You obtained a BRONZE medal!', 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(medals['bronze'], VIRTUAL_WIDTH / 2 - 22, VIRTUAL_HEIGHT / 2)
        love.graphics.printf('Press ENTER to Swim Again!', 0, 240, VIRTUAL_WIDTH, 'center')
    elseif self.score >= silver_score and self.score < gold_score then
        love.graphics.printf('You obtained a SILVER medal!', 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(medals['silver'], VIRTUAL_WIDTH / 2 - 22, VIRTUAL_HEIGHT / 2)
        love.graphics.printf('Press ENTER to Swim Again!', 0, 240, VIRTUAL_WIDTH, 'center')
    elseif self.score >= gold_score then
        love.graphics.printf('You obtained a GOLD medal!', 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(medals['gold'], VIRTUAL_WIDTH / 2 - 22, VIRTUAL_HEIGHT / 2)
        love.graphics.printf('Press ENTER to Swim Again!', 0, 240, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.printf('Press ENTER to Swim Again!', 0, 160, VIRTUAL_WIDTH, 'center')
    end
end
