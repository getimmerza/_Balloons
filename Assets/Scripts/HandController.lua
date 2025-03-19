local unity = CS.UnityEngine

local grip_hash

local anim_comp

function start()
	grip_hash = unity.Animator.StringToHash("Grip")
	anim_comp = animator:GetComponent("Animator")
end


function update()
	local grip_strength = grip_action.action:ReadValueAsObject()
	if grip_strength ~= nil then
		anim_comp:SetFloat(grip_hash, grip_strength);
	else
		anim_comp:SetFloat(grip_hash, 0.0);
	end
end