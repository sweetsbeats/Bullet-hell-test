

--require 'scripts/player'
--require 'scripts/grunt'






--BOUNDING BOX COLLISIONS

function checkCollision(x1, y1, w1, h1,  x2, y2, w2, h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
     end



--COLLLISIONS FOR ALL PLAYER/ENEMY ENCOUNTERS



function checkPlayerGruntCollisions()
  for g, newGrunt in ipairs(grunts) do
    if checkCollision(newGrunt.x, newGrunt.y, gruntImg:getWidth(), gruntImg:getHeight(), player.x, player.y, player.img:getWidth(), player.img:getHeight() ) then
      table.remove(newGrunt, g)
      player.isAlive = false
    end
  end
end


function playerBulletCollision()
  for g, grunt in ipairs(grunts) do
    for b, bullet in ipairs(bullets) do
      if checkCollision(bullet.x, bullet.y, bullet.img:getWidth(), bullet.img:getHeight(), grunt.x, grunt.y, grunt.img:getWidth(), grunt.img:getHeight()) then
        table.remove(grunt, g)
        table.remove(bullet, b)
      end
    end
  end
end
