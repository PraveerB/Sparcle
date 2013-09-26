

local storyboard = require("storyboard")
local scene = storyboard.newScene()
require("helpers.GroupsAndListners")
local aboutSparcleViewGroup = display.newGroup()

local function bulletsClick(event)
    print(event.target.text)
    if(event.target.text == "Project Highlights") then
        storyboard.gotoScene( 'views.projectHighlight', "flip", 400)
    elseif(event.target.text == "Virtual Tour") then
        storyboard.gotoScene( 'views.virtualTour', "flip", 400)
    elseif(event.target.text == "Floor Plans") then
        storyboard.gotoScene( 'views.floorPlans', "flip", 400)
    elseif(event.target.text == "Construction Updates") then
        storyboard.gotoScene( 'views.constructionUpdates', "flip", 400)
    end
end


-- Called when the scene's view does not exist:
function scene:createScene( event)
    if(system.getInfo("model") == "iPad") then
        local imageBG1 = display.newImage(aboutSparcleViewGroup , "assets/img/bg2.jpg", display.contentHeight*display.contentWidth)
        local centerImg = display.newImage(aboutSparcleViewGroup, "assets/img/circle-image.png", 250 , 160)
        local projectHighlightsArrow = display.newImage(aboutSparcleViewGroup, "assets/img/arrow.png", 750 , 300)
        local projectHighlightsText = display.newText(aboutSparcleViewGroup, "Project Highlights" , 800 , 300 ,native.systemFontBold, 20)
        projectHighlightsText:addEventListener( "tap", bulletsClick)
        local virtualTourArrow = display.newImage(aboutSparcleViewGroup , "assets/img/arrow.png", 750 , 350)
        local virtualTourText = display.newText(aboutSparcleViewGroup , "Virtual Tour" , 800 , 350 ,native.systemFontBold, 20)
        virtualTourText:addEventListener("tap", bulletsClick)
        local floorPlansArrow = display.newImage(aboutSparcleViewGroup ,"assets/img/arrow.png", 750 , 400)
        local floorPlansText = display.newText(aboutSparcleViewGroup ,"Floor Plans" , 800 , 400 ,native.systemFontBold, 20)
        floorPlansText:addEventListener("tap", bulletsClick)
        local constructionUpdatesArrow= display.newImage(aboutSparcleViewGroup , "assets/img/arrow.png", 750 , 450)
        local constructionUpdatesText = display.newText(aboutSparcleViewGroup , "Construction Updates" , 800 , 450 ,native.systemFontBold, 20)
        constructionUpdatesText:addEventListener("tap", bulletsClick)
        
        --layoutItems[1].name = "imageBG"
    else
        local imageBG1 = display.newImage(aboutSparcleViewGroup , "assets/img/bg2.jpg", display.contentHeight*display.contentWidth)
        local centerImg = display.newImage(aboutSparcleViewGroup, "assets/img/circle-image.png", 250 , 160)
        local projectHighlightsArrow = display.newImage(aboutSparcleViewGroup, "assets/img/arrow.png", 750 , 300)
        local projectHighlightsText = display.newText(aboutSparcleViewGroup, "Project Highlights" , 800 , 300 ,native.systemFontBold, 20)
        projectHighlightsText:addEventListener( "tap", bulletsClick)
        local virtualTourArrow = display.newImage(aboutSparcleViewGroup , "assets/img/arrow.png", 750 , 350)
        local virtualTourText = display.newText(aboutSparcleViewGroup , "Virtual Tour" , 800 , 350 ,native.systemFontBold, 20)
        virtualTourText:addEventListener("tap", bulletsClick)
        local floorPlansArrow = display.newImage(aboutSparcleViewGroup ,"assets/img/arrow.png", 750 , 400)
        local floorPlansText = display.newText(aboutSparcleViewGroup ,"Floor Plans" , 800 , 400 ,native.systemFontBold, 20)
        floorPlansText:addEventListener("tap", bulletsClick)
        local constructionUpdatesArrow= display.newImage(aboutSparcleViewGroup , "assets/img/arrow.png", 750 , 450)
        local constructionUpdatesText = display.newText(aboutSparcleViewGroup , "Construction Updates" , 800 , 450 ,native.systemFontBold, 20)
        constructionUpdatesText:addEventListener("tap", bulletsClick)
        
        --layoutItems[1].name = "imageBG"
    end
    
    createMenuGroup()
    mainMenuGroupItems:toFront()
    navigationGroup:toFront()
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