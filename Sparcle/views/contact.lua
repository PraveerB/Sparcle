print("CONTACT:::::::::")

---------------------------------------------------------------------------------
--
-- scene1114.lua
--
---------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
require("helpers.GroupsAndListners")
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
-- print(table.getn(a)) 

-- Touch event listener for background image

-- Called when the scene's view does not exist:
function scene:createScene( event )
    if(system.getInfo("model") == "iPad") then
        local imageBG1 = display.newImage("assets/img/bg2.jpg", display.contentHeight*display.contentWidth)
        --layoutItems[1].name = "imageBG"
    else
        local imageBG1 = display.newImage("assets/img/bgLower.jpg", display.contentHeight*display.contentWidth)
        --layoutItems[1].name = "imageBG"
    end
    --layoutItems.isVisible = false
    createMenuGroup()
    mainMenuGroupItems:toFront()
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	print( "HS: enterScene event" )
	-- remove previous scene's view
	local prior_scene = storyboard.getPrevious()
	storyboard.purgeScene( prior_scene )
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	print( "HS: exitScene event" )
		--vary:removeEventListener( "touch", vary)
	
end

-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	print( "((destroying homeScreen's view))" )
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

--"didExitScene" event is dispatched when scene becomes off-screen
--scene:addEventListener( "didExitScene", scene)

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene