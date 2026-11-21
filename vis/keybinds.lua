local n = vis.modes.NORMAL
local v = vis.modes.VISUAL

vis:map(n, " y", '"+y')
vis:map(v, " y", '"+y')
vis:map(n, " p", '"+p')
vis:map(v, " p", '"+p')

for _, k in ipairs({ "h", "j", "k", "l" }) do
    vis:command(("map normal <M-%s> <C-w>%s"):format(k, k))
end

vis:map(n, "<F5>", function()
    vis:command("e!")
end, "Reload file from disk")

vis:operator_new("gf", function(file, range, _)
    local name = file:content(range)
    local parent = file.path:gsub("/[^/]*$", "")

    local p = io.popen(
        "find '"
            .. parent
            .. "' -type f -path '*"
            .. name
            .. "*' "
            .. "-not -path '*/.git/*'"
    )
    local paths = {}
    for path in p:lines() do
        paths[#paths + 1] = path
    end
    p:close()

    if #paths == 0 or #paths > 4 then
        vis:info("Found " .. #paths .. " file results for '" .. name .. "'")
    else
        for _, path in ipairs(paths) do
            vis:command("open " .. path)
        end
    end
    return range.start -- new cursor location
end, "Open files matching selection")
