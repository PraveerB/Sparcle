print("model ::::: "..system.getInfo("model"))
if(system.getInfo("model") == "iPad") then
    application = {
            content = {
                    width =  768,
                    height = 1024, 
                    scale = "letterBox",
                    fps = 30,
            }
    }
else
        application = {
            content = {
                    width =  600,
                    height = 1024, 
                    scale = "letterBox",
                    fps = 30,
            }
    }

end
