require('vis')

vis.events.subscribe(vis.events.INIT, function()
    require('keybinds')
end)

require('options')
require('fmt')
