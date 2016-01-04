story.talk_form = "size[8,7.5;]"
story.talk_form = story.talk_form..default.gui_colors
story.talk_form = story.talk_form..default.gui_bg
story.talk_form = story.talk_form.."image[0,0.0;3,8;story_player.png]"
story.talk_form = story.talk_form.."label[2.5,0;%s]"
story.talk_form = story.talk_form.."image[6,0.0;3,8;story_character_1.png]"

story.set_talk_form = function(pos, name, text)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", string.format(story.talk_form, text))
	meta:set_string("infotext", name)
	local inv = meta:get_inventory()
	inv:set_size("main", 8*4)
end
