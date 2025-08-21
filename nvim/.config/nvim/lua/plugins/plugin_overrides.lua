return {

  -- add gruvbox just in case
  -- { "ellisonleao/gruvbox.nvim" },

  -- set neovim theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
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
      })
    end,
  },
}
