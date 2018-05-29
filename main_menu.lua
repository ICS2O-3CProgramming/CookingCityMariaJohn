
-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Maria T
-- Date: Month Day, Year
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditButton
local helpButton

local bkgMusic = audio.loadStream( "Sounds/Lets_Go_2.mp3")
local bkgMusicChannel = audio.play( bkgMusic, { channel=1, loops=-1 } )
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function LevelSelectTransition( )
    composer.gotoScene( "level_select", {effect = "fromBottom", time = 500})
end    

-- Creating Transition to credit Screen
local function CreditScreenTransition( )
    composer.gotoScene( "credit_screen", {effect = "fromBottom", time = 500})
end  

-- Creating Transition to help Screen
local function HelpScreenTransition( )
    composer.gotoScene( "help_screen", {effect = "fromBottom", time = 500})
end    


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenu.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight*3.3/8,

            -- Insert the images here
            defaultFile = "Images/StartButtonMaria.png",
            overFile = "Images/StartButtonMariaPressed.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = LevelSelectTransition          
        } )
    ---------------------------------------------------------------------------------------
    -- Creating Credits Button
    creditButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight*4.4/8,

            -- Insert the images here
            defaultFile = "Images/CreditButtonMaria.png",
            overFile = "Images/CreditButtonMariaPressed.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = CreditScreenTransition          
        } )
    ---------------------------------------------------------------------------------------
    -- Creating help Button
    helpButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight*5.5/8,

            -- Insert the images here
            defaultFile = "Images/HelpButtonMaria.png",
            overFile = "Images/HelpButtonMariaPressed.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = HelpScreenTransition          
        } ) 



        sceneGroup:insert( playButton )
        sceneGroup:insert( helpButton )
        sceneGroup:insert( creditButton )

end 
-- function scene:create( event )   



-----------------------------------------------------------------------------------------

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

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: play timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        
    end
end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

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

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

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
