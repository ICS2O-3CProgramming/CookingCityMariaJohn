
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
sceneName = "level_select"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local level1Button
local level2Button
local level3Button

local level1
local level2
local level3


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function level1( )
    composer.gotoScene( "level1_screen", {effect = "fromBottom", time = 500})
end    

-- Creating Transition to level2 Screen
local function level2( )

    composer.gotoScene( "level2_screen", {effect = "fromBottom", time = 500})
end  

-- creating transition to level3 screen
local function level3( )
    composer.gotoScene( "level3_screen", {effect = "fromBottom", time = 500})

end 


local function school( )
    composer.gotoScene( "school_screen", {effect = "fromBottom", time = 500})
end 

local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 500})
end

local function school( )
    composer.gotoScene( "school_screen", {effect = "fromBottom", time = 500})
    
end

local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "slideDown", time = 500})

end



-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/LevelSelectScreen.png")
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

    -- Creating level1 Button
    level1Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*2.3/8,
            y = display.contentHeight/2,

            -- Insert the images here
            defaultFile = "Images/level1button.png",
            overFile = "Images/level1buttonpressed.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = school          
        } )
    ---------------------------------------------------------------------------------------
    -- Creating level2 Button
    level2Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*4/8,
            y = display.contentHeight/2,

            -- Insert the images here
            defaultFile = "Images/level2button.png",
            overFile = "Images/level2buttonpressed.png",



            -- When the button is released, call the Level2 screen transition function
            onRelease = level2          
        } )
    ---------------------------------------------------------------------------------------
    -- Creating level3 Button
    level3Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*5.7/8,
            y = display.contentHeight/2,

            -- Insert the images here
            defaultFile = "Images/level3button.png",
            overFile = "Images/level3buttonpressed.png",



            -- When the button is released, call the Level2 screen transition function
            onRelease = level3         
        } )

    -------------------------------------------------------------------------------------

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1.5/8,
        y = display.contentHeight*9.2/11,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtonMaria.png",
        overFile = "Images/BackButtonMariaPressed.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -- Associating Buttons with this scene
    sceneGroup:insert( backButton )
    sceneGroup:insert( level1Button )
    sceneGroup:insert( level2Button )
    sceneGroup:insert( level3Button )
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
        
        --Go to MainMenu
        timer.performWithDelay ( 3000, gotoschool_screen) 

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
        bkgMusicChannel1 = audio.stop()

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
