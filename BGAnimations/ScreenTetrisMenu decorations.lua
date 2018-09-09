local container = Widg.Container {x=SCREEN_WIDTH/2,y=SCREEN_HEIGHT/2}
container[#container+1] = Widg.Button {onClick=screenChange("ScreenTetris")}
container[#container+1] = Widg.Sprite {y=-150,texture="logo", color = color("#0000ffff")}
return Def.ActorFrame { container}