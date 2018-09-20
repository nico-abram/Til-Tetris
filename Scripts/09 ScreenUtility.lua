function changeScreen(screen)
	local topScreen = SCREENMAN:GetTopScreen()
	if topScreen then
		topScreen:SetNextScreenName(screen):StartTransitioningScreen("SM_GoToNextScreen")
	end
end

function resetCurrentScreen()
	if SCREENMAN then
		local topScreen = SCREENMAN:GetTopScreen()
		if topScreen then
			topScreen:SetNextScreenName(topScreen:GetName()):StartTransitioningScreen("SM_GoToNextScreen")
		end
	end
end

function screenChange(name)
	return function()
		changeScreen(name)
	end
end
