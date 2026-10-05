local theme_file = "/home/piq9117/dotfiles/dev_theme"

local function get_config(file)
    local file_handler = io.open(file, "rb")

    local config = file_handler:read()

    local theme = {}
    
    for word in string.gmatch(config, '([^,]+)') do
      table.insert(theme, word)
    end

    return theme
end

local function trim_space(str)
  return string.gsub(str, '%s+', '')
end

local function set_theme(color_scheme, theme)
  local color_scheme = trim_space(color_scheme)
  local theme = trim_space(theme)


  local catppuccin_light = function ()
      require("catppuccin").setup({
        background = {
          dark = "mocha",
          light = "latte"
        },
        no_italic = true,
        color_overrides = {
          -- latte = {
          --   base = "#DBD6D1",
          --   mantle = "#DBD6D1",
          --   crust = "#DBD6D1",
          --
          --   overlay1 = "#999999",
          -- }
        },
        highlight_overrides = {
         all = function(colors)
            return {
              LineNr = { fg = colors.overlay1 },
              -- IblIndent = { fg = colors.overlay1 },
              IblScope = { fg = colors.overlay1 },
            }
          end
        }
      })

      vim.cmd.colorscheme("catppuccin-latte")
  end

  local themes = {
    vscode = function()
      require("vscode").setup()
      if theme == "light" then
        vim.o.background = "light";
      else
        vim.o.background = "dark"
      end
        vim.cmd.colorscheme "vscode"
    end,
    fleuriste = function ()
      require("fleuriste").setup()
      vim.cmd.colorscheme "fleuriste"
    end,
    nightfox = function()
      require("nightfox").setup({
        options = {
          transparent = false
        }
      })

      if theme == "light" then
        vim.cmd("colorscheme dayfox")
      else
        vim.cmd("colorscheme carbonfox")
      end
    end,
    monokai = function()
      local filter
      if theme == "light" then
        filter = "light"
      else
        filter = "classic"
      end
      require("monokai-pro").setup({
        filter = filter
      })
      require("monokai-pro").load()
    end,
    onedark = function()
      require("onedark").load();

      if theme == "light" then
        require("onedark").setup {
          style = "light",
        }
        require("onedark").load()
      else
        require("onedark").setup {
          style = "warmer",
          transparent = false
        }
        require("onedark").load()
      end
    end,
    catppuccin = function()
      require("catppuccin").setup({
        background = {
          dark = "macchiato",
          light = "latte"
        },
        no_italic = true,
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
        highlight_overrides = {
          all = function(colors)
            return {
              LineNr = { fg = colors.overlay1 },
              -- IblIndent = { fg = colors.overlay1 },
              IblScope = { fg = colors.overlay1 },
            }
          end
        }
      })

      if theme == "light" then
        catppuccin_light()
      else 
        vim.cmd.colorscheme("catppuccin")
      end
    end,
  }

  if themes[color_scheme] then
    return themes[color_scheme]()
  else
    print("Theme " .. color_scheme .. " not found")
  end

end

local config = get_config(theme_file)

vim.api.nvim_set_hl(0, "Normal", {bg = nil})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = nil})
vim.api.nvim_set_hl(0, "NonText", {bg = nil})
vim.api.nvim_set_hl(0, "@comment.haskell", {link = "Comment"})

set_theme(config[1], config[2])

