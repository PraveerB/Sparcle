local storyboard = require "storyboard"
mainMenuGroupItems = display.newGroup()
subMenuGroupItems = display.newGroup()

local function buttonClick(e)
    print(e.target.name)
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

function createMainMenuGroup()
    local menu = display.newImage(mainMenuGroupItems , "assets/menu.png", display.viewableContentWidth-62, display.viewableContentHeight-52)
    mainMenuGroupItems[1].name = "menu"
    menu:addEventListener( "touch", buttonClick )
    
    local music = display.newImage(mainMenuGroupItems , "assets/music.png", display.contentWidth-(62*2-5), display.contentHeight-57)
    mainMenuGroupItems[2].name = "music"
    music:addEventListener( "touch", buttonClick )
end


function createSubMenuGroup()
    local menuClicked = display.newImage(subMenuGroupItems , "assets/menu.png", display.viewableContentWidth-62, display.viewableContentHeight-52)
    subMenuGroupItems[1].name = "menuClicked"
    menuClicked:addEventListener( "touch", buttonClick )
    
    local contact = display.newImage(subMenuGroupItems , "assets/contact.png", display.contentWidth-62, display.contentHeight-(40+52))
    subMenuGroupItems[2].name = "contact"
    contact:addEventListener( "touch", buttonClick )

    local download = display.newImage(subMenuGroupItems , "assets/download.png", display.contentWidth-62, display.contentHeight-(40+52+39))
    subMenuGroupItems[3].name = "download"
    download:addEventListener( "touch", buttonClick )

    local feedback = display.newImage(subMenuGroupItems , "assets/feedback.png", display.contentWidth-61, display.contentHeight-(40+52+39+40+1))
    subMenuGroupItems[4].name = "feedback"
    feedback:addEventListener( "touch", buttonClick )

    local notification = display.newImage(subMenuGroupItems , "assets/notification.png", display.contentWidth-61, display.contentHeight-(40+52+39+40+44+1))
    subMenuGroupItems[5].name = "notification"
    notification:addEventListener( "touch", buttonClick )
end


function createMenuGroup()
    createMainMenuGroup()
    createSubMenuGroup()
end


