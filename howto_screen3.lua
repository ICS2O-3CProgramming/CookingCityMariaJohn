-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: John Ngundeng
-- Date: May 16, 2017
-- Description: This is the level 1 screen of the game. the charater can be dragged to move
--If character goes off a certain araea they go back to the start. When a user interactes
--with piant a trivia question will come up. they will have a limided time to click on the answer
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )



-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "howto_screen2"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local resumeText
local text1
local text2
local text3
local text4
local text5
local text6
local text7
local text8
local icedcake
local Steps


local bkg
local cover


local userAnswer
local textTouched = false

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
local function BackToLevel1() 
    composer.hideOverlay("crossFade", 400 )
  
    ResumeGame()
end 

-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerResume(touch)
    
    if (touch.phase == "ended") then

        BackToLevel1( )
    
    end 
end




--adding the event listeners 
local function AddTextListeners ( )
    resumeText:addEventListener( "touch", TouchListenerResume )
end

--removing the event listeners
local function RemoveTextListeners()
    resumeText:removeEventListener( "touch", TouchListenerResume )
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(231/255, 166/255, 36/255)

    -- create the question text object
    text1 = display.newText("1: Add butter.", display.contentCenterX/1.8, display.contentCenterY*3/5.5, Arial, 50) 
    text1:setTextColor(0, 0, 0 )

    -- create the question text object
    text2 = display.newText("2: Add flour.", display.contentCenterX/1.9, display.contentCenterY*3/4, Arial, 50) 
    text2:setTextColor(0, 0, 0 )

    -- create the question text object
    text3 = display.newText("3: Add sugar.", display.contentCenterX/1.9, display.contentCenterY, Arial, 50) 
    text3:setTextColor(0, 0, 0 )
    
    -- create the question text object
    text4 = display.newText("4: Add egg.", display.contentCenterX/1.8, display.contentCenterY/3*3.7, Arial, 50) 
    text4:setTextColor(0, 0, 0 )

    -- create the question text object
    text5 = display.newText("5: Add milk. ", display.contentCenterX*1.3, display.contentCenterY*3/5.5, Arial, 50) 
    text5:setTextColor(0, 0, 0 )

    -- create the question text object
    text6 = display.newText("6: Add vanilla extract.", display.contentCenterX*1.5, display.contentCenterY*3/4, Arial, 50) 
    text6:setTextColor(0, 0, 0 )

    -- create the question text object
    text7 = display.newText("7: Mix the bowl.", display.contentCenterX*1.37, display.contentCenterY, Arial, 50) 
    text7:setTextColor(0, 0, 0 )
    
    -- create the question text object
    text8 = display.newText("8: Bake the cake .", display.contentCenterX*1.42, display.contentCenterY/3*3.7, Arial, 50) 
    text8:setTextColor(0, 0, 0 )

    -- create the question text object
    text9 = display.newText("9: Add icing.", display.contentCenterX, display.contentCenterY/3*4.3, Arial, 50) 
    text9:setTextColor(0, 0, 0 )

    -- create the question text object
    Steps = display.newText("Steps.", display.contentCenterX, display.contentCenterY/3.5, Arial, 75) 
    Steps:setTextColor(0, 0, 0 )
    
    -- create the question text object
    resumeText = display.newText("Resume", display.contentCenterX, display.contentCenterY/3*5.5, Arial, 70)
    resumeText:setTextColor(0, 0, 0 )

    -- Insert the image
    icedcake = display.newImageRect("L3images/cake.png", 350, 350 )
    icedcake.x = display.contentCenterX
    icedcake.y = display.contentCenterY*1.64
    icedcake:scale (0.3, 0.3)


    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(resumeText)
    sceneGroup:insert(text1)
    sceneGroup:insert(text2)
    sceneGroup:insert(text3)
    sceneGroup:insert(text4)
    sceneGroup:insert(text5)
    sceneGroup:insert(text6)
    sceneGroup:insert(text7)
    sceneGroup:insert(text8)
    sceneGroup:insert(text9)
    sceneGroup:insert(Steps)
    sceneGroup:insert(icedcake)


end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        
        AddTextListeners()
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        RemoveTextListeners()
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

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )



-----------------------------------------------------------------------------------------

return scene