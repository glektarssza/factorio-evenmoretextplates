-- EVEN MORE TEXT PLATES
-- Based on the classic Factorio mod by Earendel, y.petremann and gheift
local evenmoretextplates = require("globals")

for _, type in pairs(evenmoretextplates.new_types) do
    local size = type.size
    local material = type.material
    local materialtype = (material == "plasticcolored") and "plastic" or material
    local count = 0

    count = count + 1

    local graphicspath = "__even-more-text-plates-2_0__/graphics"
    if materialtype == "plastic" and settings.startup["even-more-text-plates-2_0-legacy-plastic"].value then
      graphicspath = graphicspath.."/legacy"
    end

    local base_item = {
      type = "item",
      name = type.name, -- no symbol suffix
      icon = graphicspath.."/icon/"..material.."/blank.png",
      icon_size = 64,
      flags = {}, -- not hidden
      subgroup = "textplates",
      order = "f[textplates]-"..material.."-"..(size == "small" and 1 or 2).."-"..string.format( "%03d", count ),
      stack_size = 100,
      place_result = type.name,
      localized_name = { "item-name.textplate", { "textplates."..size }, {"textplates.".. material } }
    }
    if size == "large" then
      base_item.icon = graphicspath.."/icon/"..material.."/square.png"
    end

    data:extend({ base_item })

    for _, symbol in pairs(type.symbols) do
      local symbol_item = {
        type = "item",
        name = type.name .. "-" .. symbol, -- all symbols must have the base item name followed by the symbol with "-" joining the two
        icon = graphicspath.."/icon/"..materialtype.."/"..symbol..".png",
        icon_size = 64,
        hidden = true,
        subgroup = "textplates",
        order = "f[textplates]-"..material.."-"..(size == "small" and 1 or 2).."-"..string.format( "%03d", count ),
        stack_size = 100,
        place_result = type.name,
        localized_name = { "item-name.textplate", { "textplates."..size }, {"textplates.".. material } }
      }
      data:extend({ symbol_item })
    end
  end
