return {

  -- Luarocks
  { 'vhyrro/luarocks.nvim',
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { 'magick' },
    },
  },

--[[ 
  -- Nav bar
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {},
  },
 ]]

  -- Oil file manager
  {'stevearc/oil.nvim',
    opts = {},
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require("oil").setup({
        default_file_explorer = true,
      })
    end,
  },

  -- Telescope
  { 'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', "debugloop/telescope-undo.nvim" },
    config = function()
      require("telescope").setup({
        -- the rest of your telescope config goes here
        extensions = {
          undo = {},
        },
      })
      require("telescope").load_extension("undo")
      -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    end,
   },

  -- Comment
  { 'numToStr/Comment.nvim',
    opts = {},
    config = function()
      require('Comment').setup({})
    end,
  },

  -- Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter',
   build = ":TSUpdate",
   event = { "BufReadPre", "BufNewFile" },
   dependencies = {
     "windwp/nvim-ts-autotag",
   },

   config = function()
     local treesitter = require("nvim-treesitter.configs")
     treesitter.setup({
       highlight = {
         enable = true,
       },
       indent = {
         enable = true
       },
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "json",
        "yaml",
        "html",
        "css",
        "lua",
        "gitignore",
        "rust",
      },
     })
   end,
  },

  -- Trouble
  { "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
      require("trouble").setup({
        use_diagnostic_signs = true,
        icons = false,
        fold_open = "v", -- icon used for open folds
        fold_closed = ">", -- icon used for closed folds
        indent_lines = false, -- add an indent guide below the fold icons
        signs = {
          -- icons / text used for a diagnostic
          error = "error",
          warning = "warn",
          hint = "hint",
          information = "info"
        },
      })
    end,
  },

  -- Conform
  { "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { { "prettierd", "prettier", stop_after_first = true } },
          typescript = { { "prettierd", "prettier", stop_after_first = true } },
          javascriptreact = { { "prettierd", "prettier", stop_after_first = true } },
          typescriptreact = { { "prettierd", "prettier", stop_after_first = true } },
          json = { { "prettierd", "prettier", stop_after_first = true } },
          erb = { "htmlbeautifier" },
          html = { "htmlbeautifier" },
          rust = { "rustfmt" },
          css = { { "prettierd", "prettier", stop_after_first = true } },
          scss = { { "prettierd", "prettier", stop_after_first = true } },
          go = { "gofmt" },
        },
    })
    end,
  },

  -- Neogit
--[[  { "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true
  },
]]

  -- Hardtime
--[[   { "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {}
 },
 ]]

  -- Precognition
  { "tris203/precognition.nvim", 
   event = "VeryLazy",
   opts = {}
  },

  -- Leap
  { "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },

  -- Rustaceanvim
  { "mrcjkb/rustaceanvim",
    lazy = false, -- This plugin is already lazy
  },

  -- My ows plugins
  -- :3
  -- RandTheme
  { "Styzex/RandTheme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("randtheme").setup({
        reroll_keymap = "<leader>tr",
        change_on_startup = true,
        print_theme_name = true,
        include_builtin_themes = false,
      })
    end,
  },
}

