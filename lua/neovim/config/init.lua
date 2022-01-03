-- these settings will be merged with any settings definined in config.lua
local default_config = {
    border = 'rounded',
    theme = 'xresources',
    lsp = {
        format_on_save = true, -- true/false or table of filetypes {'.ts', '.js',}
        rename_notification = true,
        -- vim.diagnostic.config settiings
        servers = {
            rust = true,
            jsonls = {
                format = true
            },
            sumneko_lua = {
                format = true -- disable formatting all together
            },
            html = true,
            tsserver = {
                format = true -- disable formatting all together
            }
        }
    }
}

local config = default_config
local user_servers = vim.tbl_keys(config.lsp.servers)

function config.lsp.can_client_format(client_name)
    if config.lsp.servers[client_name] == true then
        return true
    end

    if vim.tbl_contains(user_servers, client_name) and config.lsp.servers[client_name] then
        return (config.lsp.servers[client_name].format == true)
    end

    return true
end

return config
