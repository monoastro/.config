local function get_plugins_storage()
    local handle = io.popen("du -sh ~/.local/share/nvim")
    if not handle then
        print("Failed to execute command")
        return
    end

    local result = handle:read("*a")
    handle:close()

    if not result then
        print("Failed to read file handle")
        return
    end

    local size = result:match("^(%S+)")
    if not size then
        print("Failed to parse size from command output")
        return
    end

    print(string.format("Total storage used: %s", size))
end

vim.api.nvim_create_user_command('PluginsStorage', get_plugins_storage, {})

