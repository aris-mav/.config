local slimecmd

local function shellescape(s)
    return "'" .. (s:gsub("'", "'\\''")) .. "'"
end

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    if os.getenv("KITTY_WINDOW_ID") then
        slimecmd = function(text)
            local target = "title:repl"
            os.execute(
                "kitten @ send-text --bracketed-paste=enable --match "
                    .. target
                    .. " -- "
                    .. shellescape(text)
            )
            os.execute("kitten @ send-key --match " .. target .. " enter")
        end
    else
        slimecmd = function(string)
            vis:info("slimecmd has not been set")
        end
    end
end)

vis:operator_new("s", function(file, range, pos)
    slimecmd(file:content(range))
    return pos
end, "")
