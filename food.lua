local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- -------------------------------------------------------------------------------


-- "scene:create()"
local coldDrinks
local pickerWheel
local Fvalues
local lastFvalue
local nextSceneButton
local title
local button
local buttonText
--bg = background
local bg
local function changeScenes()
    Fvalues = pickerWheel:getValues()
    lastFvalue = Fvalues[1].value
    composer.setVariable("lastFvalue", Fvalues[1].value)
    composer.gotoScene("picknickList")

end

function scene:create( event )
    local sceneGroup = self.view

    bg = display.newImage("fika.png",display.contentCenterX, display.contentCenterY/2.5)
    sceneGroup:insert(bg)

    title = display.newText("Tilltugg", display.contentCenterX, display.contentCenterY, display.contentWidth/2, display.contentHeight*.8, "Helvetica", 30)
    title:setFillColor(0,1,0)
    sceneGroup:insert(title)

    buttonText = display.newText("Gå till visa lista",display.contentCenterX*2, display.contentCenterY,display.contentHeight,display.contentWidth/6, "Helvetica", 15)
    button = display.newRect(display.contentCenterX, display.contentCenterY*0.95,display.contentHeight*1.7,display.contentWidth/6)
    button:setFillColor(0,1,0)
    button:addEventListener("tap", changeScenes)
    sceneGroup:insert(button)
    sceneGroup:insert(buttonText)
    --Configure the picker wheel columns
    coldDrinks = 
        {
    -- De kalla drinkarna
    { 
        align = "left",
        width = 240,
        height = 500,
        startIndex = 3,
        labels = { "Smörgås","Soppa","Tårta","Kaka","Bullar","Frukt","Bär"}
    }

}



local options = {
    frames = 
    {
        { x=0, y=0, width=320, height=222 },
        { x=320, y=0, width=320, height=222 },
        { x=640, y=0, width=8, height=222 }
    },
    sheetContentWidth = 648,
    sheetContentHeight = 222
}
local pickerWheelSheet = graphics.newImageSheet( "widget-pickerwheel-standard.png", options )

-- Create the widget
    pickerWheel = widget.newPickerWheel(
    {
        top = display.contentHeight - 222,
        columns = coldDrinks,
        sheet = pickerWheelSheet,
        overlayFrame = 1,
        overlayFrameWidth = 320,
        overlayFrameHeight = 222,
        backgroundFrame = 2,
        backgroundFrameWidth = 320,
        backgroundFrameHeight = 222,
        separatorFrame = 3,
        separatorFrameWidth = 8,
        separatorFrameHeight = 222,
        columnColor = { 0, 0, 0, 0 },
        fontColor = { 0.4, 0.4, 0.4, 0.5 },
        fontColorSelected = { 0.2, 0.6, 0.4 }
    }
)
    pickerWheel.x = display.contentCenterX
    sceneGroup:insert(pickerWheel)
-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
   -- Fvalues = pickerWheel:getValues()
    local function onDoneButtonRelease(event)
 
        if event.phase == "tap" then
 
           composer.setVariable("lastFvalue", Fvalues[1].value)
 
                display.remove( pickerWheel )
                pickerWheel = nil
 
                display.remove( doneButton )
                doneButton = nil
 
            end
        end
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
