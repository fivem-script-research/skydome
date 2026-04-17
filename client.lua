CreateThread(function()
    while not NetworkIsSessionStarted() do
        Wait(1000)
    end

    --Wait(5000)

    ApplySkyTextures()

    --while true do
    --    Wait(30000)
    --    ApplySkyTextures()
    --end
end)

function ApplySkyTextures()
    local id = PlayerId()

    while not NetworkIsPlayerActive(id) do
        Citizen.Wait(0)
    end

    RequestStreamedTextureDict("skydome_textures")
    while not HasStreamedTextureDictLoaded("skydome_textures") do
        Citizen.Wait(0)
    end

    AddReplaceTexture("platform:/textures/skydome", "moon-new", "skydome_textures", "moon-new")
    AddReplaceTexture("platform:/textures/skydome", "starfield", "skydome_textures", "starfield")
    SetStreamedTextureDictAsNoLongerNeeded("skydome_textures")
end
