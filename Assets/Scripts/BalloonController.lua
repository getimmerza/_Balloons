local unity = CS.UnityEngine
local lua_comp = CS.ImmerzaSDK.Lua.LuaComponent

local move_speed = unity.Random.Range(0.5, 1.5)
local kill_at_height = 50.0

local is_paused = false

function start()
	CS.ImmerzaSDK.ImmerzaEvents.OnPauseRequested('+', function() is_paused = not is_paused end)
	renderer.material.color = unity.Random.ColorHSV(0.0, 1.0, 1.0, 1.0, 0.5, 1.0)
end

function on_trigger_enter(collider)
	if string.find(collider.name, "Arrow") ~= nil then
		local particle = unity.GameObject.Instantiate(burst_particle, transform.position, unity.Quaternion.identity)
		particle:GetComponent("LuaComponent").scriptEnv.play_effect()
		destroy_balloon(true)
	end
end

function update()
	if is_paused then
		return
	end

	if transform.position.y > kill_at_height then
		destroy_balloon(false)
	end

	transform.position = transform.position + unity.Vector3.up * move_speed * unity.Time.deltaTime
end


function destroy_balloon(collided)
	lua_comp.TriggerEvent("OnBalloonPopped", { has_collided = collided })
	unity.GameObject.Destroy(gameObject)
end
