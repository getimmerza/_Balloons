local unity = CS.UnityEngine

local num = 0

function start()
	CS.ImmerzaSDK.Lua.LuaComponent.RegisterEvent("OnBalloonPopped", function(event_data) 
		if not event_data.has_collided then
			return
		end
		num = num + 1
		text_field:GetComponent("TMP_Text").text = num
	end)
end