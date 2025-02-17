local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_mode

return {
  s('repeat', {
    t { 'await repeatSection(async () => {)' },
    i(1, ''),
    t { '});' },
  }),
}
