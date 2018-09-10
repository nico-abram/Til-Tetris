
local bgSprite = Widg.Sprite {width=SCREEN_WIDTH,height=SCREEN_HEIGHT,texture = "bgs/"..config.bgTexture}
local container = Widg.Container {
	x=SCREEN_WIDTH/2,
	y=SCREEN_HEIGHT/2, 
	content = {
		bgSprite,
		Widg.Button {width=200,height=40,text="Start Game", onClick=screenChange("ScreenTetris")},
		Widg.Button {y=50,width=200,height=40,text="Etterna Options", onClick=screenChange("ScreenOptionsService")}
	}
}
container[#container+1] = Widg.Sprite {y=-150,texture="logo", color = color("#3333aaff")}
--container[#container+1] = Widg.Sprite {width=SCREEN_WIDTH,height=SCREEN_HEIGHT,texture="bg"}
return Def.ActorFrame { container}