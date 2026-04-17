CreateThread(function()
    while not NetworkIsSessionStarted() do
        Wait(1000)
    end

    Wait(5000)

    ApplySkyTextures()

    while true do
        Wait(30000)
        ApplySkyTextures()
    end
end)

function ApplySkyTextures()
    local txd = CreateRuntimeTxd("skydome_runtime")

    -- STARFIELD
    local duiStars = CreateDui("nui://skydome/stream/starfield.png", 1024, 1024)
    local handleStars = GetDuiHandle(duiStars)
    CreateRuntimeTextureFromDuiHandle(txd, "starfield", handleStars)
    AddReplaceTexture("skydome", "starfield", "skydome_runtime", "starfield")

    -- MOON
    local duiMoon = CreateDui("nui://skydome/stream/moon-new.png", 512, 512)
    local handleMoon = GetDuiHandle(duiMoon)
    CreateRuntimeTextureFromDuiHandle(txd, "moon-new", handleMoon)
    AddReplaceTexture("skydome", "moon", "skydome_runtime", "moon-new")
end
