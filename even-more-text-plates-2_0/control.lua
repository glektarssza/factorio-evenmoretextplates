local evenmoretextplates = require("globals")

remote.add_interface("even-more-text-plates-2_0", {
	textplates_add_types = function() return evenmoretextplates.new_types end,
	textplates_add_characters_for_symbols = function() return evenmoretextplates.symbol_by_char end,
})
