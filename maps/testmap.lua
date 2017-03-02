
require 'scripts/grunt'
require 'scripts/player'
require 'scripts/collision'

--map variables


--timer variables
seconds = 0
addSecond = 1
zeroSecond = 0

--timestamp variables

wave1 = true


        --LOVE.LOAD FUNCTIONS

function initializeEnemies()
gruntInitializeTextures()
end


        -- LOVE.UPDATE FUNCTIONS

function timer(dt)
  while runtime do
    seconds = seconds + (1*dt)
    love.text.draw(seconds)
  end
end


function testMap(dt)
  timer(dt)

checkPlayerGruntCollisions()
playerBulletCollision()

gruntMove(dt)

  while wave1 do
    gruntSpawn(dt, 100, -30)
    gruntSpawn(dt, 200, -30)
      wave1 = false
    break
  end

end

        --LOVE.DRAW FUNCTIONS

function testMapDrawEnemies(dt)

gruntDraw(dt)

end
