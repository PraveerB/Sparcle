-- hide device status bar
display.setStatusBar( display.HiddenStatusBar )
system.activate( "multitouch" )

-- load library to allow global listening for display, graphics and physics function call events
require("helpers.multitouch")
require("helpers.pinchlib")

local layoutItems = display.newGroup()
local MAXZOOMLAVEL = 50
local MINZOOMLAVEL = 0
currentZoomLavel= 0

if(system.getInfo("model") == "iPad") then
    local imageBG = display.newImage( layoutItems , "assets/bg1.jpg", display.contentHeight*display.contentWidth)
    layoutItems[1].name = "imageBG"
else
    local imageBG = display.newImage(layoutItems , "assets/bgLower.jpg", display.contentHeight*display.contentWidth)
    layoutItems[1].name = "imageBG"
end
    
local menu = display.newImage(layoutItems , "assets/menu.png", display.viewableContentWidth-62, display.viewableContentHeight-52)
layoutItems[2].name = "menu"

local feedback = display.newImage(layoutItems , "assets/feedback.png", display.contentWidth-62, display.contentHeight-41 * 2)
layoutItems[3].name = "feedback"

local contact = display.newImage(layoutItems , "assets/contact.png", display.contentWidth-62, display.contentHeight-50 * 3)
layoutItems[4].name = "contact"
i = 1
while (layoutItems[i] ~= nil) do
    print(layoutItems[i].name)
  i=i+1
end


function multitouch(e)
	--print('do multitouch',e.target)
	if (e.phase == "began") then
                --print("begin::::::")
		doPinchZoom( e.target, {}, suppressrotation, suppressscaling, suppresstranslation )
		doPinchZoom( e.target, e.list, suppressrotation, suppressscaling, suppresstranslation )
        elseif (e.phase == "moved") then
                --print("moved::::::")
--                if(currentZoomLavel == 0) then
--                   currentZoomLavel = currentZoomLavel + 1 
--                end
                print(currentZoomLavel)
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
                --print("end::::::")
		doPinchZoom( e.target, {}, suppressrotation, suppressscaling, suppresstranslation )
	end
	return true -- unfortunately, this will not propogate down if false is returned
end

-- add multitouch listener the same way we would add a touch listener
--img:addEventListener( "multitouch", multitouch )
--img2:addEventListener( "multitouch", multitouch )

layoutItems:addEventListener( "multitouch", multitouch )
--grp2:addEventListener( "multitouch", multitouch )