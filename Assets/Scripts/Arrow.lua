local unity = CS.UnityEngine

local player_throws = false

function start()
	interactable.selectEntered:AddListener(on_select_entered);
	interactable.selectExited:AddListener(on_select_exited);
end

function update()
	if player_throws and rigidbody.linearVelocity.magnitude > 1.0 then
		if not trail_particle.activeSelf then
			trail_particle:SetActive(true);
		end

		transform.rotation = unity.Quaternion.LookRotation(rigidbody.linearVelocity)
	end

	if transform.position.y < -100.0 then
		unity.GameObject.Destroy(gameObject);
	end
end

function on_select_entered(args)
	if args.interactorObject.transform:CompareTag("Player") then
		player_throws = false;
	end
end

function on_select_exited(args)
	if args.interactorObject.transform:CompareTag("Player") then
		player_throws = true;
	end
end