-- level1_screen.lua
-- Created by: John N
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
sceneName = "level3_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local bowl
local milkCarton    
local cheese
local vanillaExtract
local lettuce
local flourBag
local sugarBag
local butterBlock
local egg
local shreddedcheese
local milk
local vanilla
local flour
local sugar
local butter
local eggYolkz
local goal
local tomato
local mix
local bake
local batter
local cake
local icing 
local icedCake
-- text for level1
local level3text
local lives = 3
local points = 0
local correctfood = 0
local correctObject1
local correctObject2
local correctObject3

local incorrectObject1
local incorrectObject2
local incorrectObject3
local incorrectObject4

local hat1
local hat2
local hat3

local bkgMusic1 = audio.loadStream( "Sounds/ArabianSalsa2.mp3")
local bkgMusicChannel1 = audio.play( bkgMusic1, { channel=1, loops=-1 } )
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------


function ResumeGame()

end

local function HideCorrect()
    correctObject1.isVisible = false
    correctObject2.isVisible = false
    correctObject3.isVisible = false
end


local function HideIncorrect()
    incorrectObject1.isVisible = false
    incorrectObject2.isVisible = false
    incorrectObject3.isVisible = false
    incorrectObject4.isVisible = false
end

local function RestartLevel3()
    -- makes all the objects visible or invisible when scene starts
    butterBlock.isVisible = true
    butter.isVisible = false
    flour.isVisible = false
    flourBag.isVisible = true
    sugarBag.isVisible = true
    sugar.isVisible = false
    vanillaExtract.isVisible = true
    vanilla.isVisible = false
    bowl.isVisible = true
    eggYolk.isVisible = false
    egg.isVisible = true
    milkCarton.isVisible = true
    milk.isVisible = false
    hat1.isVisible = true
    hat2.isVisible = true
    hat3.isVisible = true

    points = 0
    correctfood = 0
    lives = 3
end

local function YouLoseTransition()
    composer.gotoScene( "you_lose" )
end

local function YouWinTransition()
    composer.gotoScene( "you_Win" )
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerResume(touch)
    
    if (touch.phase == "ended") then

        BackToLevel1( )
    
    end 
end

function L3WrongAnswer()
    
    incorrectObject2.isVisible = true
    timer.performWithDelay(1000, HideIncorrect)
    -- show overlay with math question
    lives = lives - 1
    
   if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
end

function L3WrongAnswer2()
    
    incorrectObject2.isVisible = true
    
    if (points == 3) then
        
        timer.performWithDelay(1000, YouWinTransition)
    
    elseif (points == 2) then  
        timer.performWithDelay(1000, YouWinTransition)

    
    elseif (points == 1) then

        timer.performWithDelay(200, YouLoseTransition)
    
    elseif (points == 0) then

        timer.performWithDelay(200, YouLoseTransition)
    end

    if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
end

function L3RightAnswer()
    
    correctObject2.isVisible = true
    timer.performWithDelay(1000, HideCorrect)
    -- show overlay with math question
    points = points + 1
    
    if (points == 3) then

        timer.performWithDelay(1000, YouWinTransition)
    end
end

function L3RightAnswer2()
    
    correctObject2.isVisible = true
    timer.performWithDelay(1000, HideCorrect)
    -- show overlay with math question
    points = points + 1
    
    if (points == 3) then
        
        timer.performWithDelay(1000, YouWinTransition)
    
    elseif (points == 2) then  
        timer.performWithDelay(1000, YouWinTransition)

    
    elseif (points == 1) then

        timer.performWithDelay(200, YouWinTransition)
    
    elseif (points == 0) then

        timer.performWithDelay(200, YouLoseTransition)

    end
end

-- Creating Transition to help Screen
local function OptionScreen( )
    -- show overlay with math question
    composer.showOverlay( "options_screen", { isModal = true, effect = "fade", time = 100})
end 

-- Creating Transition to help Screen
local function HowToScreen( )
    -- show overlay with math question
    composer.showOverlay( "howto_screen", { isModal = true, effect = "fade", time = 100})
end 

-- Creating Transition to help Screen
local function MixButton()
    -- show overlay with math question
    if (correctfood == 3) then

        batter.isVisible = true
        -- make the beef visible over top of the tacoShell
        eggYolk.isVisible = false
        milk.isVisible = false
        sugar.isVisible = false
        flour.isVisible = false
        vanilla.isVisible = false
        butter.isVisible = false

        timer.performWithDelay(1000, HideCorrect)
        -- adding to the score
        correctfood = correctfood  + 1 
        -- show overlay with math question
        composer.showOverlay( "L2question4", { isModal = true, effect = "fade", time = 100})
    else
        incorrectObject4.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        
        if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
    end
end

-- Creating Transition to help Screen
local function BakeButton()
    -- show overlay with math question
    if (correctfood == 3) then

        cake.isVisible = true
        -- make the batter invisible
        batter.isVisible = false

        timer.performWithDelay(1000, HideCorrect)
        -- adding to the score
        correctfood = correctfood  + 1 
        -- show overlay with math question
        composer.showOverlay( "L2question4", { isModal = true, effect = "fade", time = 100})
    else
        incorrectObject4.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        
        if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
    end
end

-- Creating Transition to help Screen
local function EggButton()
    -- show overlay with math question
    if (correctfood == 0) then
        -- make the beef packet invisible
        egg.isVisible = false

        -- make the beef visible over top of the tacoShell
        eggYolk.isVisible = true

        timer.performWithDelay(1000, HideCorrect)
        -- adding to the score
        correctfood = correctfood  + 1 
        -- show overlay with math question
        composer.showOverlay( "L2question2", { isModal = true, effect = "fade", time = 100})

    else
        incorrectObject1.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
    end
end

-- Creating Transition to help Screen
local function IceingButton()
    -- show overlay with math question
    if (correctfood == 0) then
        -- make the beef packet invisible
        cake.isVisible = false

        -- make the beef visible over top of the tacoShell
        icedCake.isVisible = true

        timer.performWithDelay(1000, HideCorrect)
        -- adding to the score
        correctfood = correctfood  + 1 
        -- show overlay with math question
        composer.showOverlay( "L2question2", { isModal = true, effect = "fade", time = 100})

    else
        incorrectObject1.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
    end
end



-- Creating Transition to help Screen
local function FlourButton()
    -- show overlay with math question
    if (correctfood == 1) then
        -- make the beef packet invisible
        flourBag.isVisible = false

        -- make the beef visible over top of the tacoShell
        flour.isVisible = true

        timer.performWithDelay(1000, HideCorrect)
        -- adding to the score
        correctfood = correctfood  + 1 
        -- show overlay with math question
        composer.showOverlay( "L2question1", { isModal = true, effect = "fade", time = 100})
    else
        incorrectObject1.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
    end
end

-- Creating Transition to help Screen
local function SugarButton()
    -- show overlay with math question
    if (correctfood == 2) then
        -- make the beef packet invisible
        sugarBag.isVisible = false

        -- make the beef visible over top of the tacoShell
        sugar.isVisible = true

        timer.performWithDelay(1000, HideCorrect)

        -- adding to the score
        correctfood = correctfood  + 1 

        -- show overlay with question
        composer.showOverlay( "L2question3", { isModal = true, effect = "fade", time = 100})
    else
        incorrectObject3.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
    end
end

-- Creating Transition to help Screen
local function VanillaButton()
    -- show overlay with math question
    if (correctfood == 2) then
        -- make the beef packet invisible
        vanillaExtract.isVisible = false

        -- make the beef visible over top of the tacoShell
        vanilla.isVisible = true

        timer.performWithDelay(1000, HideCorrect)

        -- adding to the score
        correctfood = correctfood  + 1 

        -- show overlay with question
        composer.showOverlay( "L2question3", { isModal = true, effect = "fade", time = 100})
    else
        incorrectObject3.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
    end
end

-- Creating Transition to help Screen
local function MilkButton()
    -- show overlay with math question
    if (correctfood == 2) then
        -- make the beef packet invisible
        milkCarton.isVisible = false

        -- make the beef visible over top of the tacoShell
        milk.isVisible = true

        timer.performWithDelay(1000, HideCorrect)

        -- adding to the score
        correctfood = correctfood  + 1 

        -- show overlay with question
        composer.showOverlay( "L2question3", { isModal = true, effect = "fade", time = 100})
    else
        incorrectObject3.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
    end
end

-- Creating Transition to help Screen
local function ButterButton()
    -- show overlay with math question
    if (correctfood == 2) then
        -- make the beef packet invisible
        butterBlock.isVisible = false

        -- make the beef visible over top of the tacoShell
        butter.isVisible = true

        timer.performWithDelay(1000, HideCorrect)

        -- adding to the score
        correctfood = correctfood  + 1 

        -- show overlay with question
        composer.showOverlay( "L2question3", { isModal = true, effect = "fade", time = 100})
    else
        incorrectObject3.isVisible = true
        timer.performWithDelay(1000, HideIncorrect)
        lives = lives - 1
        
        if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
    end
end

-- Creating Transition to help Screen
local function LettuceButton()
    incorrectObject2.isVisible = true
    timer.performWithDelay(1000, HideIncorrect)
    -- show overlay with math question
    lives = lives - 1
    
   if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
end

-- Creating Transition to help Screen
local function CheeseButton()

    incorrectObject3.isVisible = true
    timer.performWithDelay(1000, HideIncorrect)
    -- show overlay with math question
    lives = lives - 1
    
    if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
end

-- Creating Transition to help Screen
local function TomatoButton()

    incorrectObject1.isVisible = true
    timer.performWithDelay(1000, HideIncorrect)
    lives = lives - 1
    
    if (lives == 3) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = true
    elseif (lives == 2) then
        hat1.isVisible = true
        hat2.isVisible = true
        hat3.isVisible = false
    elseif (lives == 1) then
        hat1.isVisible = true
        hat2.isVisible = false
        hat3.isVisible = false
    elseif (lives == 0) then
        hat1.isVisible = false
        hat2.isVisible = false
        hat3.isVisible = false
        timer.performWithDelay(200, YouLoseTransition)
    end
end

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the image
    bkg_image = display.newImageRect("Images/level3@2x.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Insert the image
    bowl = display.newImageRect("L2images/tacoShell.png", 350, 350 )
    bowl.x = display.contentCenterX
    bowl.y = display.contentCenterY/1.2

    

    -- Insert the image
    goal = display.newImageRect("L2images/tacoShell.png", 350, 350 )
    goal.x = display.contentWidth - 965
    goal.y = display.contentCenterY/1.8
    goal:scale (0.3, 0.3)

    -- Insert the image
    vanilla = display.newImageRect("L3images/vanillaExtract.png", 350, 350 )
    vanilla.x = display.contentCenterX
    vanilla.y = display.contentCenterY/1.2
    vanilla.isVisible = false

    -- Insert the image
    eggYolk = display.newImageRect("L3images/egg@2x.png", 350, 350 )
    eggYolk.x = display.contentCenterX
    eggYolk.y = display.contentCenterY/1.2
    eggYolk.isVisible = false

    -- Insert the image
    butter = display.newImageRect("L3images/butter@2x.png", 350, 350 )
    butter.x = display.contentCenterX
    butter.y = display.contentCenterY/1.2
    butter.isVisible = false

    -- Insert the image
    sugar = display.newImageRect("L3images/sugarbag.png", 350, 350 )
    sugar.x = display.contentCenterX
    sugar.y = display.contentCenterY/1.2
    sugar.isVisible = false
    
    -- Insert the image
    flour = display.newImageRect("L3images/flourbag@2x.png", 350, 350 )
    flour.x = display.contentCenterX
    flour.y = display.contentCenterY/1.2
    flour.isVisible = false
    
    -- Insert the image
    milk = display.newImageRect("L3images/milkCarton.png", 350, 350 )
    milk.x = display.contentCenterX
    milk.y = display.contentCenterY/1.2
    milk.isVisible = false
    

    level3text = display.newImageRect("L3images/level3text.png", 450, 195)
    
    --set the initial x and y position of the text
    level3text.x = 500
    level3text.y = display.contentCenterY/6

    --Create the correct text object and make it invisible
    correctObject1 = display.newText( "That's good!", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    correctObject1:setTextColor(0/255, 150/255, 255/255)
    correctObject1.isVisible = false

    --Create the correct text object and make it invisible
    correctObject2 = display.newText( "Amazing", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    correctObject2:setTextColor(0/255, 150/255, 255/255)
    correctObject2.isVisible = false

    --Create the correct text object and make it invisible
    correctObject3 = display.newText( "Almost Done!", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    correctObject3:setTextColor(0/255, 150/255, 255/255)
    correctObject3.isVisible = false

    --Create the correct text object and make it invisible
    incorrectObject1 = display.newText( "You'll get it next time", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    incorrectObject1:setTextColor(255/255, 255/255, 0/255)
    incorrectObject1.isVisible = false

    incorrectObject2 = display.newText( "That's not even close", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    incorrectObject2:setTextColor(255/255, 255/255, 0/255)
    incorrectObject2.isVisible = false

    incorrectObject3 = display.newText( "Thats not right!", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    incorrectObject3:setTextColor(255/255, 255/255, 0/255)
    incorrectObject3.isVisible = false

    incorrectObject4 = display.newText( "It's not ready!", display.contentCenterX, display.contentHeight/1.45, Georgia, 60)
    incorrectObject4:setTextColor(255/255, 255/255, 0/255)
    incorrectObject4.isVisible = false

    hat3 = display.newImageRect("L1images/Hat.png", 100, 100)
    hat3.x = display.contentWidth*0.22
    hat3.y = display.contentHeight *0.37


    hat2 = display.newImageRect("L1images/Hat.png", 100, 100)
    hat2.x = display.contentWidth*0.22
    hat2.y = display.contentHeight *0.23

    hat1 = display.newImageRect("L1images/Hat.png", 100, 100)
    hat1.x = display.contentWidth*0.22
    hat1.y = display.contentHeight *0.1



    -- Creating pause Button
    butterBlock = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.5,
            y = display.contentCenterY/2*3.3,

            -- Insert the images here
            defaultFile = "L3images/butter@2x.png",
            overFile = "L3images/butter@2x.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = ButterButton          
        } )


    -- Creating pause Button
    icing = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.5,
            y = display.contentCenterY/2*3.3,

            -- Insert the images here
            defaultFile = "L3images/butter@2x.png",
            overFile = "L3images/butter@2x.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = IceingButton         
        } )


    -- Creating pause Button
    flourBag = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.445,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L3images/flourbag@2x.png",
            overFile = "L3images/flourbag@2x.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = FlourButton          
        } )


    -- Creating pause Button
    sugarBag = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.445,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L3images/sugarbag.png",
            overFile = "L3images/sugarbag.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = SugarButton          
        } )

    -- Creating pause Button
    milkCarton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.445,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L3images/milkCarton.png",
            overFile = "L3images/milkCarton.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = MilkButton          
        } )

    -- Creating pause Button
    egg = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.445,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L3images/egg@2x.png",
            overFile = "L3images/egg@2x.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = EggButton          
        } )

    -- Creating pause Button
    vanillaExtract = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.445,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L3images/vanillaExtract.png",
            overFile = "L3images/vanillaExtract.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = VanillaButton          
        } )


    -- Creating pause Button
    tomato = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.3,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L1images/tomato.png",
            overFile = "L1images/tomato.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = TomatoButton          
        } )
    
    -- Creating pause Button
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

    -- Creating pause Button
    HowTo = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.95,
            y = display.contentCenterY,

            -- Insert the images here
            defaultFile = "L1images/Howtobutton.png",
            overFile = "L1images/Howtobuttonpressed.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = HowToScreen          
        } )

    -- Creating pause Button
    mix = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.17,
            y = display.contentHeight-35,

            -- Insert the images here
            defaultFile = "L1images/cookbutton.png",
            overFile = "L1images/cookbuttonpressed.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = MixButton          
        } )

    -- Creating pause Button
    bake = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*.17,
            y = display.contentHeight-35,

            -- Insert the images here
            defaultFile = "L1images/cookbutton.png",
            overFile = "L1images/cookbuttonpressed.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = BakeButton          
        } )

    -- Creating pause Button
    cheese = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.6,
            y = display.contentCenterY/2*3.72,

            -- Insert the images here
            defaultFile = "L1images/Cheese.png",
            overFile = "L1images/Cheese.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = CheeseButton          
        } )

    -- Creating pause Button
    lettuce = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentCenterX*1.09,
            y = display.contentCenterY/2*3.3,

            -- Insert the images here
            defaultFile = "L2images/lettuce.png",
            overFile = "L2images/lettuce.png",



            -- When the button is released, call the Level1 screen transition function
            onRelease = lettuceButton          
        } )

    

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( bowl )
    sceneGroup:insert( milkCarton) 
    sceneGroup:insert( milk)
    sceneGroup:insert( sugarBag)
    sceneGroup:insert( sugar)
    sceneGroup:insert( flour)
    sceneGroup:insert( flourBag)
    sceneGroup:insert( butter)
    sceneGroup:insert( butterBlock)
    sceneGroup:insert( egg)
    sceneGroup:insert( eggYolk)
    sceneGroup:insert( vanilla)
    sceneGroup:insert( vanillaExtract)
    sceneGroup:insert( icing)
    sceneGroup:insert( lettuce )
    sceneGroup:insert( cheese )
    sceneGroup:insert( tomato )
    sceneGroup:insert( Pause )
    sceneGroup:insert( level3text ) 
    sceneGroup:insert( HowTo )
    sceneGroup:insert( mix )
    sceneGroup:insert( bake )
    sceneGroup:insert( goal )
    sceneGroup:insert( hat1 )
    sceneGroup:insert( hat2 )
    sceneGroup:insert( hat3 )

    sceneGroup:insert( correctObject1 )
    sceneGroup:insert( correctObject2 )
    sceneGroup:insert( correctObject3 )
    sceneGroup:insert( incorrectObject1 )
    sceneGroup:insert( incorrectObject2 )
    sceneGroup:insert( incorrectObject3 )
    sceneGroup:insert( incorrectObject4 )

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

        local function MoveLevel3Text(event)

            -- change the transparency of the text so that it fades out
            level3text.alpha = level3text.alpha - 0.0005
        end

        -- MoveLevel1Text will be called over and over again
        Runtime:addEventListener("enterFrame", MoveLevel3Text)

        RestartLevel3()
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
        bkgMusicChannel1 = audio.stop()

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

