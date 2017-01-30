local composer = require( "composer" )
local lastCDvalue = require("ColdDrinks")
local lastWDvalue = require("WarmDrinks")
local lastFvalue = require("food")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- -------------------------------------------------------------------------------
local cDrink
local Wdrink
local Foo
local lastScene
local bg
-- "scene:create()"
function scene:create( event )
    local sceneGroup = self.view
    cDrink = composer.getVariable("lastCDvalue")
    Foo = composer.getVariable("lastFvalue")
    Wdrink = composer.getVariable("lastWDvalue")
    bg = display.newImage("notepad.png",display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    sceneGroup:insert(bg)
    title = display.newText("Din picknick-korg", display.contentCenterX + 45, display.contentCenterY + 80, display.contentWidth, display.contentHeight, "Helvetica", 30)
    title:setFillColor(0,50,25)
    CDtitle = display.newText(tostring(cDrink), display.contentCenterX + 100, display.contentCenterY + 165, display.contentWidth, display.contentHeight, "Helvetica", 30)
    CDtitle:setFillColor(0,0,0)
    sceneGroup:insert(CDtitle)
    WDtitle = display.newText(tostring(Wdrink),  display.contentCenterX + 100, display.contentCenterY + 200, display.contentWidth, display.contentHeight, "Helvetica", 30)
    WDtitle:setFillColor(0,0,0)
    sceneGroup:insert(WDtitle)
    Footitle = display.newText(tostring(Foo),  display.contentCenterX + 100, display.contentCenterY + 235, display.contentWidth, display.contentHeight, "Helvetica", 30)
    Footitle:setFillColor(0,0,0)
    sceneGroup:insert(Footitle)

    sceneGroup:insert(title)

    print (composer.getVariable("lastCDvalue"))
    print (composer.getVariable("lastWDvalue"))
    print (composer.getVariable("lastFvalue"))
    
    


    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end

function scene:didEnter( event )

    local sceneGroup = self.view


    --composer.setVariable("CDvalue", coldDrink)
    --composer.setVariable("WDvalue", warmDrink)  
    --composer.setVariable("Fvalue", foods)

end

-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene
