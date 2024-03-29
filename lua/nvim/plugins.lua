local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "rcarriga/nvim-notify"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use {"nvim-tree/nvim-tree.lua",
	    tag = 'nightly'
    }
    use {
        "nvim-treesitter/nvim-treesitter",
	    run = ":TSUpdate",
    }
    use "stsewd/spotify.nvim"
    use "moll/vim-bbye"
    
    -- icons
    use "nvim-tree/nvim-web-devicons"
    
    -- ui
    use "loctvl842/breadcrumb.nvim"
    use "nvim-lualine/lualine.nvim"
    use "akinsho/bufferline.nvim"
    use "goolord/alpha-nvim"
    use "lukas-reineke/indent-blankline.nvim"
    
    -- theme
    use "lunarvim/darkplus.nvim"
    
    -- helpers
    use "norcalli/nvim-colorizer.lua"
    use "windwp/nvim-autopairs"
    use "akinsho/toggleterm.nvim"
    
    -- completion
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "hrsh7th/cmp-nvim-lsp" -- lsp completion 
    use "saadparwaiz1/cmp_luasnip" -- snippet completions	
    
    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine

    -- lsp
    use "neovim/nvim-lspconfig"
    use "jose-elias-alvarez/null-ls.nvim"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "SmiteshP/nvim-navic"

    -- tests
    use {
	"nvim-neotest/neotest",
	requires = {
	    "nvim-lua/plenary.nvim",
	    "nvim-treesitter/nvim-treesitter",
	    "antoinemadec/FixCursorHold.nvim"
	}
    }

    -- debugger
    use "mfussenegger/nvim-dap"
    use "jay-babu/mason-nvim-dap.nvim"
    use "rcarriga/nvim-dap-ui"

    if PACKER_BOOTSTRAP then
	    require("packer").sync()
    end
end)

