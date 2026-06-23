return {

  -- add gruvbox just in case
  -- { "ellisonleao/gruvbox.nvim" },

  -- -- set neovim theme
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "catppuccin-mocha",
  --   },
  -- },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern", -- antes helix
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>t", group = "tabs" },
        },
      },
    },
  },
  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "cpp",
        "csv",
        "py",
      })
    end,
  },

  -- -- temporary fix to solve bufferline plugin integration with catpuccin
  -- {
  --   "catppuccin/nvim",
  --   opts = function(_, opts)
  --     local module = require("catppuccin.groups.integrations.bufferline")
  --     if module then
  --       module.get = module.get_theme
  --     end
  --     return opts
  --   end,
  --},
  -- Auto theme detection
  {
    "f-person/auto-dark-mode.nvim",
    priority = 1000,
    config = function()
      local auto_dark_mode = require("auto-dark-mode")

      auto_dark_mode.setup({
        update_interval = 2000,
        set_dark_mode = function()
          vim.api.nvim_set_option_value("background", "dark", {})
          vim.cmd("colorscheme catppuccin-mocha")
        end,
        set_light_mode = function()
          vim.api.nvim_set_option_value("background", "light", {})
          vim.cmd("colorscheme catppuccin-latte")
        end,
      })
    end,
  },
}
