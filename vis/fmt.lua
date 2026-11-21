local set_formatter = function(value, toggle, _)
    vis.formatter = toggle and not vis.formatter or value
    return true
end

local get_formatter = function()
    return vis.formatter
end

vis:option_register(
    "formatter",
    "string",
    set_formatter,
    get_formatter,
    "Define the command used by the `=` operator."
)

vis:operator_new("=", function(file, range, pos)
    local status, out, err = vis:pipe(file, range, vis.formatter)
    if status ~= 0 then
        vis:info(err)
    else
        file:delete(range)
        file:insert(range.start, out)
    end
    return pos
end, "Formatting operator, filter range through the formatter command.")

local filetype_formatters = {
    markdown = "pandoc -f markdown -t markdown --columns=50 --tab-stop=2",
    lua = "stylua --column-width 80 --indent-type spaces -",
}

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    vis:command(
        ("set formatter '%s'"):format(filetype_formatters[win.syntax] or "fmt")
    )
end)

vis.events.subscribe(vis.events.FILE_SAVE_PRE, function(file)
    if vis.formatter == "fmt" then
        return true
    end

    local win = vis.win
    local pos = win and win.selection.pos or 0
    local status, out, err =
        vis:pipe(file, { start = 0, finish = file.size }, vis.formatter)

    if status ~= 0 or not out or out == "" then
        vis:info("formatter failed: " .. (err or ""))
        return true
    end

    file:delete(0, file.size)
    file:insert(0, out)
    if win then
        win.selection.pos = math.min(pos, file.size)
    end
    return true
end)
