pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- paddle
padx=52
pady=122
padw=24
padh=4

--ball
ballx=64
bally=64
ballsize=3
ballxdir=5
ballydir=-3

--score
score=0

--lives
lives=3

--music
music(0)
 
function movepaddle()
 if btn (0) then
  padx-=3
 elseif btn(1) then
  padx+=3
 end
end

function bounceball()
 -- left
 if ballx < ballsize then
  ballxdir=-ballxdir
  sfx(0)
 end
 
 -- right
 if ballx > 128-ballsize then
  ballxdir=-ballxdir
  sfx(0)
 end
 
 -- top
 if bally < ballsize then
  ballydir=-ballydir
  sfx(0)
 end
end

function moveball()
 ballx+=ballxdir
 bally+=ballydir
end

function losedeadball()
 if bally>128-ballsize then
  lives-=1
  if lives > 0 then
   sfx(2)
   bally=24
  else
   ballydir=0
   ballxdir=0
   bally=64
   ballx=64
   sfx(3)
   music(1)
  end
 end
end

-- bounce the ball off the paddle
function bouncepaddle()
 if ballx>=padx and
    ballx<=padx+padw and
    bally>pady then
     sfx(1)
     score+=10 --increase points on hit
     ballydir=-ballydir
 end
end
 
function _update()
 movepaddle()
 bounceball()
 bouncepaddle()
 moveball()
 losedeadball()
end
 
function _draw()
 -- clear the screen
  rectfill(0,0, 128,128, 3)
 -- draw the lives
  for i=1,lives do
   spr(001,90+i*8,4)
  end
 -- draw the paddle
  rectfill(padx,pady, padx+padw,pady+padh, 15)
 -- draw the ball
  circfill(ballx,bally,ballsize,15)
 -- draw the score
  print(score,12,6,15)
end




__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000ff0ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700fffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000fffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000fffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000fff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100002355000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000001155000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010a000018550115500b5500955005550055500050003100031000210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0010000027550285501b5501d5501d5500f550095500a5500e5500b55000000075500755000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001300000f03018000150301b20019030050000f0301205016030190501a03019050190301705014030000000f030110501503017050190300500014030000000f03016050150301505010030100501403000000
011300000931008310106000831009310000000931008310093100831010600083100931000000093100831009310083101060008310093100000009310083100931008310106000831009310000000931008310
0113000007053070531f000070530705305000070530705307053070531f000070530705305000070530705307053070531f000070530705305000070530705307053070531f0000705307053050000705307053
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
03 04050644

