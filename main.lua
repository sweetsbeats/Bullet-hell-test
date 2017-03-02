
require 'scripts/player'
require 'scripts/grunt'
require 'maps/testmap'

    --main loop
  function love.load(arg)
    playerInitializeImg()

    initializeEnemies()
  end

  function love.update(dt)
    playerMovement(dt)
    playerShooting(dt)


    testMap(dt)
  end

  function love.draw(dt)
    playerDraw(dt)
    playerDrawBullets(dt)

    testMapDrawEnemies(dt)
  end
