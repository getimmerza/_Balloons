local unity = CS.UnityEngine

local cs_coroutine = (require 'CSCoroutine')

function play_effect()
	particle:Play()
	audio_source:Play()

	cs_coroutine.start(self, function()
		coroutine.yield(CS.UnityEngine.WaitForSeconds(1))
		unity.GameObject.Destroy(gameObject)
	end)
end