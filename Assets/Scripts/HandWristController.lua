local unity = CS.UnityEngine
local cs_coroutine = (require 'CSCoroutine')

local current_arrow

function start()
	socket_interactor.selectExited:AddListener(on_arrow_removed);
	spawn_new_arrow()
end

function spawn_new_arrow()
	current_arrow = unity.Object.Instantiate(arrow_prefab)
	socket_interactor:StartManualInteraction(current_arrow:GetComponent("XRGrabInteractable"))
end

function on_arrow_removed(args)
	cs_coroutine.start(self, function()
		coroutine.yield(CS.UnityEngine.WaitForSeconds(1))
		spawn_new_arrow()
	end)
end