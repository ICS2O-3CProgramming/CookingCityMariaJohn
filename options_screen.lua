-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Allison
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
local physics = require( "physics")


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "options_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local optionsText
local resumeText
local mainmenuText

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

local function GoToMainMenu() 
    composer.hideOverlay("crossFade", 400 )
  
    composer.gotoScene( "main_menu", {effect = "fromBottom", time = 500})
end 


-----------------------------------------------------------------------------------------
--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerResume(touch)
    
    if (touch.phase == "ended") then

        BackToLevel1( )
    
    end 
end


--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerMainMenu(touch)
    
    if (touch.phase == "ended") then

        GoToMainMenu()
        
    end 
end


--adding the event listeners 
local function AddTextListeners ( )
    resumeText:addEventListener( "touch", TouchListenerResume )
    mainmenuText:addEventListener( "touch", TouchListenerMainMenu)
end

--removing the event listeners
local function RemoveTextListeners()
    resumeText:removeEventListener( "touch", TouchListenerResume )
    mainmenuText:removeEventListener( "touch", TouchListenerMainMenu)
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
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(134/255, 239/255, 255/255)

    -- create the question text object
    optionsText = display.newText("Options", display.contentCenterX, display.contentCenterY*3/8, Arial, 100) 
	optionsText:setTextColor(0, 0, 0 )
    
    -- create the question text object
    resumeText = display.newText("Resume", display.contentCenterX, display.contentCenterY*2/2.5, Arial, 50)
	resumeText:setTextColor(0, 0, 0 )
    
    -- create the question text object
    mainmenuText = display.newText("Main Menu", display.contentCenterX, display.contentCenterY*3/2.5, Arial, 50)
	mainmenuText:setTextColor(0, 0, 0 )



    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(optionsText)
    sceneGroup:insert(resumeText)
    sceneGroup:insert(mainmenuText)


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