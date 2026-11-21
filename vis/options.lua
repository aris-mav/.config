local opts = {
    'showeof off',
    'autoindent on',
    'relativenumbers',
    'ignorecase',
    'tabwidth 4',
    'shell fish',
}

local ftopts = {
    makefile = { 'tabwidth 8' },
    markdown = { 'tabwidth 2', 'expandtab' },
    python   = { 'colorcolumn 89', 'expandtab' },
    julia    = { 'expandtab' },
    lua      = { 'expandtab' },
}

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    for _, o in ipairs(opts) do
        vis:command('set ' .. o)
    end
    for _, o in ipairs(ftopts[win.syntax] or {}) do
        vis:command('set ' .. o)
    end
    vis:command(
        'langmap ' ..
        'αβψδεφγηιξκλμνοπρστθωςχυζΑΒΨΔΕΦΓΗΙΞΚΛΜΝΟΠΡΣΤΘΩΣΧΥΖ ' ..
        'abcdefghijklmnoprstuvwxyzABCDEFGHIJKLMNOPRSTUVWXYZ '
    )
end)

vis.events.subscribe(vis.events.WIN_HIGHLIGHT, function()
    local cursor
    if vis.mode == vis.modes.INSERT then
        cursor = "underlined,keep_attribute"
    else
        cursor = "fore:0,back:15,keep_attribute"
    end
    vis.ui:style_define(vis.ui.style_ids.CURSOR_PRIMARY, cursor)
end)
