managers.player:player_unit():character_damage():set_invulnerable( true )
managers.player:player_unit():character_damage():set_god_mode( true )
tweak_data.player.put_on_mask_time = 0.1
function BaseInteractionExt:_has_required_upgrade() return true end
function BaseInteractionExt:_has_required_deployable() return true end
function BaseInteractionExt:can_interact(player) return true end
function PlayerManager:has_category_upgrade( category, upgrade)
	if category == "player" and (upgrade == "civ_harmless_melee" or upgrade == "civ_harmless_bullets") then return false end
	return true -- Other upgrades (eg. Joker)
end
function PlayerManager:carry_blocked_by_cooldown() return false end -- Remove cooldown between picking up bags
if not _getTimer then _getTimer = BaseInteractionExt._get_timer end
function BaseInteractionExt:_get_timer()
	if self.tweak_data == "corpse_alarm_pager" then
		return 0.1 -- if pagers don't work properly (eg. when you're a client in multiplayer) use 'return _getTimer(self)' instead.
	end
	return 0
end
PlayerManager.selected_equipment_deploy_timer = function(self) return 0 end
local car_arr = { 'being', 'mega_heavy', 'heavy', 'medium', 'light', 'coke_light' }
for i, name in ipairs(car_arr) do
	tweak_data.carry.types[ name ].throw_distance_multiplier = 3
	tweak_data.carry.types[ name ].move_speed_modifier = 99999
	tweak_data.carry.types[ name ].jump_modifier = 1
	tweak_data.carry.types[ name ].can_run = true
end
dexcool = dexcool or function()
	function PlayerManager:carry_blocked_by_cooldown() return false 
	end 
end
	dexflash = dexflash or function()
		function FlashGrenade:_play_sound_and_effects() 
		end
	end
	dexsmoke = dexsmoke or function()
		function SmokeGrenade:_play_sound_and_effects() 
		end 
	end
	dextaser = dextaser or function()
		function PlayerTased:enter( state_data, enter_data )
		PlayerTased.super.enter( self, state_data, enter_data )
		self._next_shock = Application:time() + 10
		self._taser_value = 1
		self._recover_delayed_clbk = "PlayerTased_recover_delayed_clbk"
		managers.enemy:add_delayed_clbk( self._recover_delayed_clbk, callback( self, self, "clbk_exit_to_std" ), Application:time() )
		end
	end
	function TimerGui:_set_jamming_values() return end
	function TimerGui:start( timer )
			timer = 0.01
			if self._jammed then
					self:_set_jammed( false )
					return
			end
       
			if not self._powered then
					self:_set_powered( true )
					return
			end
       
			if self._started then
					return
			end
       
			self:_start( timer )
			if managers.network:session() then
					managers.network:session():send_to_peers_synched( "start_timer_gui", self._unit, timer )
			end
	end
PlayerStandard._get_walk_headbob = function(self) return 0 end
PlayerStandard._can_stand = function(self) return true end
PlayerManager.chk_minion_limit_reached = function(self) return false end
PlayerManager.spread_multiplier = function(self) return 0 end
PlayerMovement.is_stamina_drained = function(self) return false end
PlayerStandard._can_run_directional = function(self) return true end
PlayerManager.body_armor_movement_penalty = function(self) return 2 end
plynodelayshout2 = plynodelayshout2 or function() 
		tweak_data.player.movement_state.interaction_delay = 0
		tweak_data.upgrades.morale_boost_base_cooldown = 0
		if managers.groupai.state then
			managers.groupai:state()._whisper_mode = false
		end
		if managers.player and alive(managers.player:local_player()) then
			managers.player:local_player():movement()._rally_skill_data = {
			range_sq = 99999*99999, --Buff it up a bit
			morale_boost_delay_t = 0, --managers.player:has_category_upgrade( "player", "morale_boost" ) and 0 or nil,
			long_dis_revive = true,
			revive_chance = 1,
			morale_boost_cooldown_t = tweak_data.upgrades.morale_boost_base_cooldown * managers.player:upgrade_value( "player", "morale_boost_cooldown_multiplier", 1 ), }
		end
	end
function MoneyManager.get_civilian_deduction() return 0 end
function MoneyManager.civilian_killed() return end
-- MESSAGE
if managers.hud then
	managers.hud:show_hint( { text = "PLAYER - HACK LOADED!" } )
end
-- MESAGGE