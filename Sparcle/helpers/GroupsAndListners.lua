local storyboard = require "storyboard"
mainMenuGroupItems = display.newGroup()
subMenuGroupItems = display.newGroup()
navigationGroup = display.newGroup()
local sliderHandle, sliderBar
local initialPos, maxPos = (display.viewableContentWidth/2 - 120),(display.viewableContentWidth/2 + 110)
local currentPos = initialPos
--print("initialpos::"..initialPos)
--print("maxpos::"..maxPos)
local function buttonClick(e)
    --print(e.target.name)
    storyboard.gotoScene( "views.contact", "crossFade", 70 )
    if(e.target.name == "feedback") then
        storyboard.gotoScene( 'views.feedback', "crossFade", 400)
    elseif(e.target.name == "contact") then
        --storyboard.gotoScene( 'contact', "crossFade", 400)
        storyboard.gotoScene( "views.contact", "crossFade", 70 )
    elseif(e.target.name == "menu") then
        subMenuGroupItems.isVisible = true
        subMenuGroupItems:toFront()
    elseif(e.target.name == "menuClicked") then
        subMenuGroupItems.isVisible = false
        --subMenuGroupItems:toFront()
    end
end

local function sliderBartouch( event )
    --print(event.phase)
    if event.phase == "began" then
        event.target.markX = event.x
        event.target.markY = event.y
        drag = 0
    elseif event.phase == "moved" then
        --print("liner:::"..event.y)
        local y = event.y
        local x = event.x
        if x > initialPos and x < maxPos and event.target.markY + 5 > y then
            if (x - currentPos)> 4 or (x - currentPos)< -4 then
                if (x - currentPos)> 4 then
                    for i=currentPos,x do
                        sliderHandle.x = i
                        drag = i
                    end
                elseif(x - currentPos)< -4 then
                    for i=currentPos,x,-1 do
                        sliderHandle.x = i
                        drag = i
                    end
                end
            end
        end
    elseif event.phase == "ended" then
        
        local x = event.x
        local y = event.y
        if(drag ~= 0) then
                if (x - currentPos) < 38 and (currentPos - x) < 0 then   --if slider move forward and left in the middle
                    sliderHandle.x = currentPos                          
                elseif (currentPos - x) < 35 and (x - currentPos) < 0 then    
                    sliderHandle.x = currentPos                   
                elseif (x - currentPos) > 37 and (currentPos - x) < 0 then  
                    if (x - currentPos) <= (38*3) then                                   
                        currentPos = currentPos + 77 
                        sliderHandle.x = currentPos
                    elseif (x - currentPos) > (38*3) and (x - currentPos) <= (38*5)then
                            currentPos = currentPos + (77*2)
                            sliderHandle.x = currentPos
                    elseif (x - currentPos) >= (38*5) then
                            currentPos = currentPos + (77*3)
                            sliderHandle.x = currentPos
                    end
                elseif (currentPos - x) > 37 and (x - currentPos) < 0 then
                    if currentPos - x <= (38*3) then
                        currentPos = currentPos - 77 
                        sliderHandle.x = currentPos
                    elseif currentPos - x > (38*3) and (currentPos - x) <= (38*5)then
                        currentPos = currentPos - (77*2) 
                        sliderHandle.x = currentPos
                    elseif (currentPos - x) >= (38*5) then
                        currentPos = currentPos - (77*3) 
                        sliderHandle.x = currentPos
                    end
                end
                
        else
            if x < (initialPos + 5) then
                    sliderHandle.x = initialPos+3
                    currentPos = initialPos+3
                -- goto second dot on tap
                elseif x > (initialPos+74) and x < (initialPos+80) then
                    sliderHandle.x = (initialPos+77)
                    currentPos = initialPos+77
                -- goto third dot on tap
                elseif x > (initialPos+151) and x < (initialPos+157) then
                    sliderHandle.x = (initialPos+154)
                    currentPos = (initialPos+154)
                -- goto fourth dot on tap
                elseif x > (initialPos+225) and x < (initialPos+230) then
                    sliderHandle.x = (initialPos+228)
                    currentPos = (initialPos+228)
            end
        end
        local pos = math.abs(currentPos - initialPos) / 77
        pos = math.round(pos)
        print(pos)
        if pos == 1 then
           storyboard.gotoScene( 'views.feedback', "flip", 400)
        elseif pos == 2 then
            storyboard.gotoScene( 'views.gallery', "flip", 400)
        end
    end
    return true
end

function createMainMenuGroup()
    local menu = display.newImage(mainMenuGroupItems , "assets/img/menu.png", display.viewableContentWidth-62, display.viewableContentHeight-52)
    mainMenuGroupItems[1].name = "menu"
    menu:addEventListener( "touch", buttonClick )
    
    local music = display.newImage(mainMenuGroupItems , "assets/img/music.png", display.contentWidth-(62*2-5), display.contentHeight-57)
    mainMenuGroupItems[2].name = "music"
    music:addEventListener( "touch", buttonClick )
end


function createSubMenuGroup()
    local menuClicked = display.newImage(subMenuGroupItems , "assets/img/menu.png", display.viewableContentWidth-62, display.viewableContentHeight-52)
    subMenuGroupItems[1].name = "menuClicked"
    menuClicked:addEventListener( "touch", buttonClick )
    
    local contact = display.newImage(subMenuGroupItems , "assets/img/contact.png", display.contentWidth-62, display.contentHeight-(40+52))
    subMenuGroupItems[2].name = "contact"
    contact:addEventListener( "touch", buttonClick )

    local download = display.newImage(subMenuGroupItems , "assets/img/download.png", display.contentWidth-62, display.contentHeight-(40+52+39))
    subMenuGroupItems[3].name = "download"
    download:addEventListener( "touch", buttonClick )

    local feedback = display.newImage(subMenuGroupItems , "assets/img/feedback.png", display.contentWidth-61, display.contentHeight-(40+52+39+40+1))
    subMenuGroupItems[4].name = "feedback"
    feedback:addEventListener( "touch", buttonClick )

    local notification = display.newImage(subMenuGroupItems , "assets/img/notification.png", display.contentWidth-61, display.contentHeight-(40+52+39+40+44+1))
    subMenuGroupItems[5].name = "notification"
    notification:addEventListener( "touch", buttonClick )
end

function createNavigationGroup()
    sliderBar = display.newImage(navigationGroup , "assets/img/slider.png", (display.viewableContentWidth/2 - 150), (display.contentHeight-90))
    sliderBar:addEventListener( "touch",sliderBartouch)
    navigationGroup[1].name= "sliderBar"
    local sliderDot1 = display.newImage(navigationGroup , "assets/img/dot.png", (display.viewableContentWidth/2 -120), display.contentHeight-50)
    navigationGroup[2].name="sliderDot1"
    local sliderDot2 = display.newImage(navigationGroup , "assets/img/dot.png", (display.viewableContentWidth/2 -45), display.contentHeight-50)
    navigationGroup[3].name="sliderDot2"
    local sliderDot3 = display.newImage(navigationGroup , "assets/img/dot.png", (display.viewableContentWidth/2 +30), display.contentHeight-50)
    navigationGroup[4].name="sliderDot3"
    local sliderDot4 = display.newImage(navigationGroup , "assets/img/dot.png", (display.viewableContentWidth/2 +105), display.contentHeight-50)
    navigationGroup[5].name="sliderDot4"
    sliderHandle = display.newImage(navigationGroup , "assets/img/handle.png", (display.viewableContentWidth/2 - 137), display.contentHeight-94)
    --sliderHandle:addEventListener( "touch",sliderHandletouch )
    navigationGroup[6].name="sliderHandle"
end

function createMenuGroup()
    --createNavigationGroup()
    createMainMenuGroup()
    createSubMenuGroup()
    
end


