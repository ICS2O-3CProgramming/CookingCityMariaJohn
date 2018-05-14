-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Maria T
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local pizzadough
local carrot    
local cheese
local chocolate
local peperonibag
local saucepacket
local strawberry
local tomato
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

function ResumeGame()

end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerResume(touch)
    
    if (touch.phase == "ended") then

        BackToLevel1( )
    
    end 
end

-- Creating Transition to help Screen
local function OptionScreen( )
    -- show overlay with math question
    composer.showOverlay( "options_screen", { isModal = true, effect = "fade", time = 100})
end  
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the image
    bkg_image = display.newImageRect("Images/level1.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Insert the image
    pizzadough = display.newImageRect("L1images/pizzadough.png", 350, 350 )
    pizzadough.x = display.contentCenterX
    pizzadough.y = display.contentCenterY
    
    -- Insert the image
    carrot = display.newImageRect("L1images/carrot.png", 200, 88 )
    carrot.x = display.contentCenterX*.7
    carrot.y = display.contentCenterY/2*3.3
    
    -- Insert the image
    cheese = display.newImageRect("L1images/Cheese.png", 100, 100 )
    cheese.x = display.contentCenterX*1.6
    cheese.y = display.contentCenterY/2*3.72
    
    -- Insert the image
    chocolate = display.newImageRect("L1images/Chocolate.png", 180, 68 )
    chocolate.x = display.contentCenterX*1.3
    chocolate.y = display.contentCenterY/2*3.3
    
    -- Insert the image
    peperonibag = display.newImageRect("L1images/peperonibag.png", 100, 100 )
    peperonibag.x = display.contentCenterX*.445
    peperonibag.y = display.contentCenterY/2*3.72
    
    -- Insert the image
    saucepacket = display.newImageRect("L1images/SaucePacket.png", 100, 100 )
    saucepacket.x = display.contentCenterX
    saucepacket.y = display.contentCenterY/2*3.72
    
    -- Insert the image
    strawberry = display.newImageRect("L1images/Strawberry.png", 100, 100 )
    strawberry.x = display.contentCenterX*.7
    strawberry.y = display.contentCenterY/2*3.72
    
    -- Insert the  image
    tomato = display.newImageRect("L1images/tomato.png", 100, 100 )
    tomato.x = display.contentCenterX*1.3
    tomato.y = display.contentCenterY/2*3.72
    
    -- Creating help Button
    Pause = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.87,
            y = display.contentCenterY/6.5,

            -- Insert the images here
            defaultFile = "L1images/PauseButtonUnpressed.png",
            overFile = "L1images/PauseButtonPressed.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = OptionScreen          
        } )

    
    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( pizzadough )
    sceneGroup:insert( strawberry )   
    sceneGroup:insert( saucepacket )
    sceneGroup:insert( chocolate )
    sceneGroup:insert( carrot )
    sceneGroup:insert( peperonibag )
    sceneGroup:insert( cheese )
    sceneGroup:insert( tomato )
    sceneGroup:insert( Pause ) 

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

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
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
