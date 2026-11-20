require('vis')

vis.events.subscribe(vis.events.INIT, function()
    require('keybinds')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
    for _, cmd in ipairs({
        'showeof off',
        'autoindent on',
        'relativenumbers',
        'ignorecase',
        'tabwidth 4',
        'expandtab',
        'shell fish',
    }) do
        vis:command('set ' .. cmd)
    end

    local opts = require('ftopts')[win.syntax]
    if opts then
        for _, o in ipairs(opts) do
            vis:command('set ' .. o)
        end
    end
end)

require('fmt')