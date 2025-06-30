local M = {}

function M.setup()
  local colors = {
    comment       = "#7c8488",
    bg            = "#101920",
    fg            = "#dce3e8",
    black         = "#101920",
    red      	  = "#a14e3e",
    green         = "#6c8b4c",
    yellow        = "#cbb86c",
    blue          = "#185d92",
    purple        = "#a58caa",
    cyan          = "#89c7da",
    white         = "#e8f0f4",
    black_light   = "#3a3a3a",
    red_light     = "#e0745e",
    green_light   = "#9dbb70",
    yellow_light  = "#f1dc87",
    blue_light    = "#3f91c1",
    purple_light  = "#c0a7c6",
    cyan_light    = "#b3e2f3",
    white_light   = "#ffffff"
  }

  local highlights = {
    -- UI Elements
    Normal           = { fg = colors.fg, bg = colors.bg },
    LineNr           = { fg = colors.blue },
    CursorLineNr     = { fg = colors.cyan, bold = true },
    CursorLine       = { bg = colors.black_light },
    Visual           = { fg = colors.blue , bg = colors.cyan_light },
    StatusLine       = { fg = colors.fg, bg = colors.black_light },
    StatusLineNC     = { fg = colors.comment, bg = colors.black_light },
    VertSplit        = { fg = colors.black_light, bg = colors.bg },
    Pmenu            = { fg = colors.fg, bg = colors.black_light },
    PmenuSel         = { fg = colors.bg, bg = colors.blue_light },
    Search           = { fg = colors.bg, bg = colors.yellow },
    IncSearch        = { fg = colors.bg, bg = colors.red },
    ColorColumn      = { bg = colors.black_light },
    Folded           = { fg = colors.comment, bg = colors.bg },
    SignColumn       = { bg = colors.bg },
    EndOfBuffer      = { fg = colors.bg },

    -- Standard Syntax Highlighting
    Comment          = { fg = colors.comment, italic = true },
    Constant         = { fg = colors.purple },
    String           = { fg = colors.yellow },
    Character        = { fg = colors.yellow_light },
    Number           = { fg = colors.red_light },
    Boolean          = { fg = colors.red_light },
    Float            = { fg = colors.red_light },
    Identifier       = { fg = colors.blue_light },
    Function         = { fg = colors.cyan },
    Statement        = { fg = colors.green },
    Conditional      = { fg = colors.purple_light },
    Repeat           = { fg = colors.purple },
    Label            = { fg = colors.green_light },
    Operator         = { fg = colors.white },
    Keyword          = { fg = colors.green_light, bold = false },
    Exception        = { fg = colors.red },
    PreProc          = { fg = colors.purple },
    Include          = { fg = colors.blue_light },
    Define           = { fg = colors.blue },
    Macro            = { fg = colors.purple },
    Type             = { fg = colors.green },
    StorageClass     = { fg = colors.green_light },
    Structure        = { fg = colors.cyan },
    Typedef          = { fg = colors.green_light },

    -- Treesitter Highlights
    ["@variable"]           = { fg = colors.blue_light },
    ["@variable.builtin"]   = { fg = colors.cyan, italic = true },
    ["@function"]           = { fg = colors.cyan },
    ["@function.builtin"]   = { fg = colors.cyan_light, italic = true },
    ["@parameter"]          = { fg = colors.white },
    ["@keyword"]            = { fg = colors.cyan },
    ["@keyword.function"]   = { fg = colors.red_light },
    ["@keyword.return"]     = { fg = colors.red_light },
    ["@type"]               = { fg = colors.green },
    ["@constant"]           = { fg = colors.purple },
    ["@string"]             = { fg = colors.yellow },
    ["@number"]             = { fg = colors.red },
    ["@comment"]            = { fg = colors.comment, italic = true },
    ["@operator"]           = { fg = colors.white },
    ["@punctuation"]        = { fg = colors.white },
    ["@constructor"]        = { fg = colors.purple },

    -- LSP / Diagnostics
    DiagnosticError         = { fg = colors.red },
    DiagnosticWarn          = { fg = colors.yellow },
    DiagnosticInfo          = { fg = colors.blue },
    DiagnosticHint          = { fg = colors.cyan },
    DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = colors.yellow },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = colors.blue },
    DiagnosticUnderlineHint  = { undercurl = true, sp = colors.cyan },

    -- GitSigns
    GitSignsAdd             = { fg = colors.green },
    GitSignsChange          = { fg = colors.yellow },
    GitSignsDelete          = { fg = colors.red },

    -- Telescope
    TelescopeBorder         = { fg = colors.yellow },
    TelescopeSelection      = { fg = colors.blue, bg = colors.black_light },

    -- Trees and Folders
    Directory               = { fg = colors.blue_light, bold = true },
    Title                   = { fg = colors.purple_light, bold = true },

    -- Misc
    Error                   = { fg = colors.red, bold = true },
    WarningMsg              = { fg = colors.yellow },
    MoreMsg                 = { fg = colors.green_light },
    Question                = { fg = colors.purple },
    NonText                 = { fg = colors.comment },
  }

  -- Example of linking highlights
  highlights["@namespace"] = { link = "@type" }
  highlights["Identifier"] = { link = "Keyword" }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
