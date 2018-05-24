


-- Title: Maria
-- Name: Maria T
-- Course: ICS2O/3C
-- This program displays a..

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

----------------------
local function MoveSchoolMaria(event)
	local SchoolMaria = display.newImageRect("Images/SchoolMaria.png", 200, 200)
	--local SchoolMaria = display.newRect(0,0,75,25)
	--SchoolMaria.x = 100
	--SchoolMaria.y = display.screenOriginY+50
	SchoolMaria.alpha = 1
		local function trans1()
			local function trans2()
				transition.to(SchoolMaria, {time=8000,xScale=1.1, yScale=1.1 ,onComplete=trans1})
			end
			transition.to(SchoolMaria, {time=8000,xScale=.85, yScale=.85, onComplete=trans2})
		end
		trans1()
	end
end

-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end


-- SchoolMaria will be called over and over again
Runtime:addEventListener("enterFrame", MoveSchoolMaria)

return scene



-------------------
