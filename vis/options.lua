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
end)
