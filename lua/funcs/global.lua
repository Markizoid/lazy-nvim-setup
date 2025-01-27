if vim.print then
  P = vim.print
else
  P = vim.pretty_print
end

local modules = {}

UnloadModules = function()
    for module, _ in pairs(modules) do
        package.loaded['acksld.'..module] = nil
    end
end

R = function(module)
    modules[module] = true
    return require('acksld.'..module)
end

IfHas = function(plugin_name, callback, default)
    local has_plugin, plugin = pcall(require, plugin_name)
    if has_plugin then
        return callback(plugin)
    else
        if default ~= nil then
            return default()
        end
    end
end

-- WK = function(...)
--   R('funcs.which_key').register(...)
-- end
