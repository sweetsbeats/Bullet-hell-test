

--player variables

--player "class"
player = {x = 400,
          y = 400,
          speed = 250,
          shotSpeed = 1,
          img = nil,
          imgLeft = nil,
          imgRight = nil,
          canShoot = true,
          isAlive = true}

canShootMax = 0.2
canShootTimer = canShootMax

--image variables
bulletImg = nil

--entity storage
bullets = {}

--misc


      --LOVE.LOAD FUNCTIONS

function playerInitializeImg()
player.img = love.graphics.newImage('assets/plane/plane idle.png')
player.imgLeft = love.graphics.newImage('assets/plane/plane left.png')
player.imgRight = love.graphics.newImage('assets/plane/plane right.png')

bulletImg = love.graphics.newImage('assets/bullet.png')
end

      --LOVE.UPDATE FUNCTIONS

--movement code; checks for input from z overtop movement keys for slowdown

function playerMovement(dt)
-- x axis movement
if love.keyboard.isDown('left') and love.keyboard.isDown('z') then
  if player.x > 0 then
    player.x = player.x - (player.speed*dt*0.5)
  end
elseif love.keyboard.isDown('left') then
  if player.x > 0 then
    player.x = player.x - (player.speed*dt)
  end
elseif love.keyboard.isDown('right') and love.keyboard.isDown('z') then
  if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
    player.x = player.x + (player.speed*dt*0.5)
  end
elseif love.keyboard.isDown('right') then
  if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
    player.x = player.x + (player.speed*dt)
  end
end
-- y axis movement
if love.keyboard.isDown('up') and love.keyboard.isDown('z') then
  if player.y > 0 then
    player.y = player.y - (player.speed*dt*0.5)
  end
elseif love.keyboard.isDown('up') then
  if player.y > 0 then
    player.y = player.y - (player.speed*dt)
  end
elseif love.keyboard.isDown('down') and love.keyboard.isDown('z') then
  if player.y < (love.graphics.getHeight() - player.img:getHeight()) then
    player.y = player.y + (player.speed*dt*0.5)
  end
elseif love.keyboard.isDown('down') then
  if player.y < (love.graphics.getHeight() - player.img:getHeight()) then
    player.y = player.y + (player.speed*dt)
  end
end

end

function playerShooting(dt)
--shot spacing timer
canShootTimer = canShootTimer - (player.shotSpeed * dt)
if canShootTimer < 0 then
  player.canShoot = true
end


                            --SHOOTING
--shooting and shot spacing; goes in Update function
if player.isAlive then
if love.keyboard.isDown('c') and player.canShoot then
  newBullet = { x = player.x + (player.img:getWidth()/2), y = player.y, img = bulletImg, speed = 450 }
    table.insert(bullets, newBullet)
      player.canShoot = false
      canShootTimer = canShootMax
    end
end
  --moves bullets
  for i, bullet in ipairs(bullets) do
    bullet.y = bullet.y - (bullet.speed * dt)
      if bullet.y < 0 then
        table.remove(bullet, i)
      end
    end

end


      --LOVE.DRAW FUNCTIONS

function playerDraw(dt)
if player.isAlive then
  if love.keyboard.isDown('left') then
    love.graphics.draw(player.imgLeft, player.x, player.y)
  elseif love.keyboard.isDown('right') then
    love.graphics.draw(player.imgRight, player.x, player.y)
  else
    love.graphics.draw(player.img, player.x, player.y)
  end
end
end

function playerDrawBullets(dt)
  if player.isAlive == true then
  for b, bullet in ipairs(bullets) do
    love.graphics.draw(newBullet.img, bullet.x, bullet.y)
    end
  end
end
