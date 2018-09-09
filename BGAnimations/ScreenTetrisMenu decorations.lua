
local container = Widg.Container {
	x=SCREEN_WIDTH/2,
	y=SCREEN_HEIGHT/2, 
	content = {
		Widg.Button {width=200,height=40,text="Start Game", onClick=screenChange("ScreenTetris")}
	}
}
container[#container+1] = Widg.Sprite {y=-150,texture="logo", color = color("#0000ffff")}
--container[#container+1] = Widg.Sprite {width=SCREEN_WIDTH,height=SCREEN_HEIGHT,texture="bg"}
return Def.ActorFrame { container}