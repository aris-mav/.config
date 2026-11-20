require('vis')

vis.events.subscribe(vis.events.INIT, function()
    require('keybinds')

    for name, style in pairs({
        CURSOR_PRIMARY = 'reverse',
        LINENUMBER = 'fore:8,dim',
        STATUS = '',
        STATUS_FOCUSED = '',
    }) do
        vis.ui:style_define(vis.ui.style_ids[name], style)
    end
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
