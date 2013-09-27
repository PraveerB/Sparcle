-- hide device status bar
display.setStatusBar( display.HiddenStatusBar )
--system.activate( "multitouch" )

-- load library to allow global listening for display, graphics and physics function call events
--require("helpers.multitouch")
--require("helpers.pinchlib")
local storyboard = require "storyboard"

require("helpers.GroupsAndListners")

local MAXZOOMLAVEL = 50
local MINZOOMLAVEL = 0
currentZoomLavel= 0

createNavigationGroup()
local imageBG
if(system.getInfo("model") == "iPad") then
    imageBG = display.newImage( "assets/img/bg1.jpg", display.contentHeight*display.contentWidth)
else
    imageBG = display.newImage("assets/img/bgLower.jpg", display.contentHeight*display.contentWidth)
end

local function buttonClick(e)
    print(e.target.name)
    if(e.target.name == "img1") then
        --local webView = native.newWebView( 0, 0, display.contentWidth, display.contentHeight)
        --webView:request( "assets/index.html" , system.ResourceDirectory)
    elseif(e.target.name == "contact") then
        storyboard.gotoScene( "views.contact", "crossFade", 70 )
    end
end

local contact = display.newImage("assets/img/contact.png", display.contentWidth-62, display.contentHeight-(40))
contact.name = "contact"
contact:addEventListener( "tap", buttonClick )

function multitouch(e)
	--print('do multitouch',e.target)
	if (e.phase == "began") then
                --print("begin::::::")
		doPinchZoom( e.target, {}, suppressrotation, suppressscaling, suppresstranslation )
		doPinchZoom( e.target, e.list, suppressrotation, suppressscaling, suppresstranslation )
        elseif (e.phase == "moved") then
                if(currentZoomLavel >= MINZOOMLAVEL and currentZoomLavel <= MAXZOOMLAVEL) then
                    doPinchZoom( e.target, e.list, suppressrotation, suppressscaling, suppresstranslation )
                    if(currentZoomLavel > MAXZOOMLAVEL) then
                        currentZoomLavel = MAXZOOMLAVEL
                    end
                    if(currentZoomLavel < MINZOOMLAVEL) then
                        currentZoomLavel = MINZOOMLAVEL
                    end
                end
            else
		doPinchZoom( e.target, {}, suppressrotation, suppressscaling, suppresstranslation )
	end
	return true -- unfortunately, this will not propogate down if false is returned
end
--imageBG:toBack()
navigationGroup:toFront()
-- add multitouch listener the same way we would add a touch listener
--img:addEventListener( "multitouch", multitouch )
--img2:addEventListener( "multitouch", multitouch )

--menuGroupItems:addEventListener( "multitouch", multitouch )
--grp2:addEventListener( "multitouch", multitouch )