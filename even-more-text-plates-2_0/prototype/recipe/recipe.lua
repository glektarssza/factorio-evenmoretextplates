-- EVEN MORE TEXT PLATES
-- Based on the classic Factorio mod by Earendel, y.petremann and gheift

for _, type in pairs(evenmoretextplates.new_types) do
    local size = type.size
    local material = type.material
    local materialtype = (material == "plasticcolored") and "plastic" or material
    local tech = data.raw.technology["textplates-"..type.material]

    local graphicspath = "__even-more-text-plates-2_0__/graphics"
    if materialtype == "plastic" and settings.startup["even-more-text-plates-2_0-legacy-plastic"].value then
      graphicspath = graphicspath.."/legacy"
    end

    local recipe = {
      type = "recipe",
      name = type.name,
      icon = graphicspath.."/icon/" .. material .. "/blank.png",
      icon_size = 64,
      category = "crafting",
      enabled = tech == nil,
      energy_required = 0.25,
      ingredients = {{type = "item", name = type.ingredient, amount = 1}},
      results= {{type = "item", name = type.name, amount = 1}},
    }
    if size == "large"  then
      recipe.ingredients[1].amount = 4
      recipe.energy_required = 0.5
      recipe.icon = graphicspath.."/icon/" .. material .. "/square.png"
    end
    if tech then
      table.insert(tech.effects, { type = "unlock-recipe", recipe = type.name})
    end
    data:extend({recipe})
  end
