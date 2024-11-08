-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         vim.cmd.colorscheme("catppuccin-mocha")
--     end,
-- }
return {
    "nyoom-engineering/oxocarbon.nvim",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
    config = function()
        vim.opt.background = "dark" -- set this to dark or light
        vim.cmd("colorscheme oxocarbon")
    end
}
