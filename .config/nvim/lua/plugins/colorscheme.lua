return {
  { "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd[[colorscheme sequoia]]
    end,
  },
  { "Hiroya-W/sequoia-moonlight.nvim",
    lazy = false,
    priority = 1000,
  },
  { "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },
  { "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "Styzex/Sonomin.nvim",
    lazy = false,
    priority = 1000
  },
  {
    "Yazeed1s/minimal.nvim",
    lazy = false,
    priority = 1000
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000
  },
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        transparency = true
      })
    end
  },
}
