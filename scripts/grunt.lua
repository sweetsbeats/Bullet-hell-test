

--variables
grunt = {x = nil, y = nil, img = love.graphics.newImage('assets/plane/plane idle.png') , speed = 250}


grunts = {}


        --LOVE.DRAW FUNCTIONS

function gruntInitializeTextures()
gruntImg = love.graphics.newImage('assets/plane/plane idle.png')
end

        --LOVE.UPDATE FUNCTIONS

function gruntSpawn(dt, gruntX, gruntY)
  canSpawn = true
  while canSpawn do
    newGrunt = {x = gruntX, y = gruntY, img = gruntImg, speed = 250}
    table.insert(grunts, newGrunt)
    canSpawn = false
    break
  end
end
function gruntMove(dt)
    for i, newGrunt in ipairs(grunts) do
      newGrunt.y = newGrunt.y + (newGrunt.speed*dt)
      if newGrunt.y > 600 then
        table.remove(newGrunt, i)
      end
  end
end




        --LOVE.DRAW FUNCTIONS

function gruntDraw(dt)
  for g, newGrunt in ipairs(grunts) do
    love.graphics.draw(newGrunt.img, newGrunt.x, newGrunt.y)
  end
end
