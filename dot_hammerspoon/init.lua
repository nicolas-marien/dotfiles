hs.hotkey.bind({"alt"}, "space", function()
    local app = hs.application.get("Alacritty")
    print(hs.spaces.focusedSpace())
    if app then
        if not app:mainWindow() then
            app:selectMenuItem({"alacritty", "New OS window"})
        elseif app:isFrontmost() then
            app:hide()
        else
            app:activate()
        end
    else
        hs.application.launchOrFocus("alacritty")
    end

    local window = app:mainWindow()
    if window then 
        local focusedSpace = hs.spaces.focusedSpace()
        if focusedSpace then
            hs.spaces.moveWindowToSpace(window, focusedSpace)
            local output = hs.spaces.gotoSpace(focusedSpace)
            print(output)
        end
    end
end)
