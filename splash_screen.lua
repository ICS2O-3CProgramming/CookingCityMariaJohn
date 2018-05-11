-- splash_screen.lua
-- Created by: Maria Temu
-- Date: 11 April, 2018
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

--load physics
local physics = require("physics")

-- Name the Scene
sceneName = "splash_screen"

-- Start physics
physics.start()
-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local CompanyLogo
local cake
local cake2
local tomato
local tomato2
local pizza
local pizza2
local cheese
local cheese2
local broccoli
local broccoli2
local scrollSpeed = 1
local scrollXSpeed = 10
local scrollYSpeed = -10
local WhooshboomSounds = audio.loadSound("Sounds/Whoosh-boom.mp3")
local WhooshboomSoundsChannel
local Title

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

local function moveCompanyLogo(event)

    --make the CompanyLogo crest rotate
    CompanyLogo.rotation = CompanyLogo.rotation + scrollSpeed

    -- change the transparency of the CompanyLogo every time is moves so that it fades 
    CompanyLogo.alpha = CompanyLogo.alpha + 0.01
end

local function cake()
    -- creating first ball
    local cake = display.newImage("Images/cake.png", 0, 0)
    cake.x = 100
    cake.y = -20
    cake:scale(0.6, 0.6)

    -- add to physics 
    physics.addBody(cake, {density=3.0, friction=3.5, bounce=0.6, radius=50})
end

local function cake2()
    -- creating first ball
    local cake2 = display.newImage("Images/cake.png", 0, 0)
    cake2.x = 600
    cake2.y = -20
    cake2:scale(0.6, 0.6)

    -- add to physics 
    physics.addBody(cake2, {density=3.0, friction=3.5, bounce=0.6, radius=50})
end


local function tomato()
    -- creating first ball
    local tomato = display.newImage("Images/tomato.png", 0, 0)
    tomato.x = 300
    tomato.y = -20

    -- add to physics 
    physics.addBody(tomato, {density=3.0, friction=3.5, bounce=0.6, radius=50})
    tomato:scale(0.6, 0.6)
end

local function tomato2()
    -- creating first ball
    local tomato2 = display.newImage("Images/tomato.png", 0, 0)
    tomato2.x = 900
    tomato2.y = -20

    -- add to physics 
    physics.addBody(tomato2, {density=3.0, friction=3.5, bounce=0.6, radius=50})
    tomato2:scale(0.6, 0.6)
end


local function pizza()
    -- creating first ball
    local pizza = display.newImage("Images/pizza.png", 0, 0)
    pizza.x = 400
    pizza.y = -20

    -- add to physics 
    physics.addBody(pizza, {density=3.0, friction=3.5, bounce=0.6, radius=50})
    pizza:scale(0.6, 0.6)
end

local function pizza2()
    -- creating first ball
    local pizza2 = display.newImage("Images/pizza.png", 0, 0)
    pizza2.x = 800
    pizza2.y = -20

    -- add to physics 
    physics.addBody(pizza2, {density=3.0, friction=3.5, bounce=0.6, radius=50})
    pizza2:scale(0.6, 0.6)
end

local function cheese()
    -- creating first ball
    local cheese = display.newImage("Images/cheese.png", 0, 0)
    cheese.x = 300
    cheese.y = -20

    -- add to physics 
    physics.addBody(cheese, {density=3.0, friction=3.5, bounce=0.6, radius=50})
    cheese:scale(0.5, 0.5)
end

local function cheese2()
    -- creating first ball
    local cheese2 = display.newImage("Images/cheese.png", 0, 0)
    cheese2.x = 700
    cheese2.y = -20

    -- add to physics 
    physics.addBody(cheese2, {density=3.0, friction=3.5, bounce=0.6, radius=50})
    cheese2:scale(0.6, 0.6)
end


local function broccoli()
    -- creating first ball
    local broccoli = display.newImage("Images/broccoli.png", 0, 0)
    broccoli.x = 450
    broccoli.y = -20

    -- add to physics 
    physics.addBody(broccoli, {density=3.0, friction=3.5, bounce=0.6, radius=50})
    broccoli:scale(0.3, 0.3)
end

local function broccoli2()
    -- creating first ball
    local broccoli2 = display.newImage("Images/broccoli.png", 0, 0)
    broccoli2.x = 200
    broccoli2.y = -20

    -- add to physics 
    physics.addBody(broccoli2, {density=3.0, friction=3.5, bounce=0.6, radius=50})
    broccoli2:scale(0.1, 0.1)
end

-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 255/255, 255/255, 0/255)

    -- Insert the CompanyLogo image
    CompanyLogo = display.newImageRect("Images/CompanyLogoJohn.png", 200, 200)

    -- set the initial x and y position of the CompanyLogo
    CompanyLogo.x = 500
    CompanyLogo.y = display.contentHeight/2

    --A&P corp
    Title = display.newText("A&P Corp",500,550,nil,80)

    Title:setFillColor( 211, 211, 211 )

    transition.to(Title,{time=1000,xScale=1.5,yScale=1.5,onComplete=transition_2})

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( CompanyLogo )
    sceneGroup:insert( Title )    
end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        WhooshboomSoundsChannel = audio.play(WhooshboomSounds )

        -- Call the moveCompanyLogo function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", moveCompanyLogo)

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the Whooshboom sounds channel for this screen
        audio.stop(WhooshboomSoundsChannel)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------
timer.performWithDelay( 56, cake)
timer.performWithDelay( 500, tomato)
timer.performWithDelay( 300, pizza)
timer.performWithDelay( 1500, cheese)
timer.performWithDelay( 800, broccoli)

timer.performWithDelay( 80, cake2)
timer.performWithDelay( 900, tomato2)
timer.performWithDelay( 100, pizza2)
timer.performWithDelay( 680, cheese2)
timer.performWithDelay( 1000, broccoli2)

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- timer.performWithDelay( 0, cake)

-----------------------------------------------------------------------------------------

return scene
