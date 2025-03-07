local allowCountdown = false

function onCreate()
if isStoryMode and not allowCountdown then
    allowCountdown = true;
    setProperty('inCutscene', true);
	runTimer('startDialogue', 0.8);
	makeLuaSprite('DarkSolidD', 'DarkSolid', -100, -100);
	setScrollFactor('DarkSolidD', 0, 0);
	scaleObject('DarkSolidD', 1.2, 1.2);
	--setObjectCamera('DarkSolidD','camDialogBack')
	addLuaSprite('DarkSolidD', true);	
	setProperty('isFirstDialogue',true)
end
end

function onStartCountdown()
	
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue3-1', 'dialog1');
		preloadAssets()
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	
	

end

function onSkipDialogue(count)
	

end



function onTweenCompleted( tag )

end

function preloadAssets( ... )
	makeLuaSprite('cg1-1', 'cg1-1', -100, -100);
	setScrollFactor('cg1-1', 0, 0);
	scaleObject('cg1-1', 1.2, 1.2);
	setObjectCamera('cg1-1','camDialogBack')
	addLuaSprite('cg1-1', true);
	--doTweenAlpha('cg1-1A', 'cg1-1', 0, 0.001)
	
	
end

function onDialogueFinished()
		doTweenAlpha("dialogueBackA3","camDialogBack",0,.2,'cubeOut')
		doTweenAlpha("dialogueA3","camDialog",0,.2,'cubeOut')
		doTweenAlpha('K1', 'cg1-1', 0,.2 ,'cubeOut')
		doTweenAlpha('DF', 'DarkSolidD', 0,.2 ,'cubeOut')
		
		isSkip = getProperty('skipDialogueEndCallback')
		if isSkip == false then
		--restartSong(true)
		end
end