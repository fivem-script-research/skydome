local function ApplyOriginalTextures()
    RemoveReplaceTexture("platform:/textures/skydome", "moon-new")
    RemoveReplaceTexture("platform:/textures/skydome", "starfield")
end

local function ApplySkyTexturesYTD()
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

local function ApplySkyTexturesPNG()
    local id = PlayerId()

    while not NetworkIsPlayerActive(id) do
        Citizen.Wait(0)
    end

    local txd = CreateRuntimeTxd("skydome_runtime")
    CreateRuntimeTextureFromImage(txd, "moon-new", "images/moon-new.png")
    CreateRuntimeTextureFromImage(txd, "starfield", "images/starfield.png")

    AddReplaceTexture("platform:/textures/skydome", "moon-new", "skydome_runtime", "moon-new")
    AddReplaceTexture("platform:/textures/skydome", "starfield", "skydome_runtime", "starfield")
end

CreateThread(function()
    while not NetworkIsSessionStarted() do
        Wait(1000)
    end

    ApplyOriginalTextures()

    --ApplySkyTexturesYTD()
    ApplySkyTexturesPNG()
end)




