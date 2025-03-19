local unity = CS.UnityEngine
local lua_comp = CS.ImmerzaSDK.Lua.LuaComponent

local min_dist = 11.0
local max_dist = 22.0
local is_paused = false

local max_spawned_balloons = 50
local num_balloons = 0

local spawn_time = 0.0

function start()
	lua_comp.RegisterEvent("OnBalloonPopped", function (event_data)
			num_balloons = num_balloons - 1
		end
	)
end

function update()
    if spawn_time >= 1.0 then
        spawn_balloon()
        spawn_time = 0.0
    end

    spawn_time = spawn_time + unity.Time.deltaTime;
end

function spawn_balloon()
    if num_balloons >= max_spawned_balloons then
        return
    end

    local random_pos = unity.Random.insideUnitCircle
    local spawn_pos = random_pos * (max_dist - min_dist) + random_pos.normalized * min_dist

    unity.GameObject.Instantiate(balloon_prefab, transform.position + unity.Vector3(spawn_pos.x, 0.0, spawn_pos.y), balloon_prefab.gameObject.transform.rotation)

    num_balloons = num_balloons + 1
end