managers.experience:debug_add_points( 50000000, false )
managers.skilltree:_set_points(564)
managers.money:_add_to_total(90000001)
if not _setFOV then _setFOV = Camera.set_fov end
function Camera:set_fov( new_fov )
	return _setFOV(self, 120)
end
managers.player:player_unit():camera()._camera_object:set_fov()
-- MESSAGE
if managers.hud then
	managers.hud:show_hint( { text = "MONEY,LEVEL,SKILL,FOV - HACK LOADED!" } )
end
-- MESAGGE