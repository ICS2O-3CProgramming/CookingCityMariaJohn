-- Title: MovingImages
-- Name: Maria T
-- Course: ICS2O/3C
-- This program displays a beetle ship moving 
-- across the screen as well as another object 
-- moving in a different direction

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)


-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

sceneName = "school_screen"
-----------------------------------------------------------------------------------------

--Create Scene Object
local scene = composer.newScene( sceneName )

-- background image with width and height
--local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------

scrollSpeed = 4

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- characheter image with width and height
local SchoolMaria 

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Function: MoveSchoolMaria
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the SchoolMaria
local function MoveSchoolMaria(event)

	-- The width equals the width plus the scrollspeed 
	SchoolMaria.width = SchoolMaria.width + scrollSpeed

	-- The Height equals the height plus the scrollspeed
	SchoolMaria.height = SchoolMaria.height + scrollSpeed

	--summerSoundChannel = audio.play(summerSound)
end

-- The function that will go to the main menu 
local function gotoLevel1()
    composer.gotoScene( "level_screen" )
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    SchoolMaria = display.newImage("Images/SchoolMaria.png")

    -- Creating pause Button
    carrot = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.6,
            y = display.contentCenterY/2*3.3,

            -- Insert the images here
            defaultFile = "L1images/carrot.png",
            overFile = "L1images/carrot.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = StrawberryButton          
        } )
	-- set the image to be transparent
	--SchoolMaria.alpha = 1

	--SchoolMaria:scale (1, 1)

	--set the initial x and y position of SchoolMaria
	--SchoolMaria.x = 515
	--SchoolMaria.y = 350

	-- insert the object into the scene group
	sceneGroup:insert( SchoolMaria )


end



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
       -- WhooshboomSoundsChannel = audio.play(WhooshboomSounds )

        -- Call the moveCompanyLogo function as soon as we enter the frame.
        --Runtime:addEventListener("enterFrame", MoveSchoolMaria)

        -- Go to the main menu screen after the given time.
        --timer.performWithDelay ( 3000, gotoLevel1)          
        
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
        --
        --audio.stop(WhooshboomSoundsChannel)
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


return scene



-------------------