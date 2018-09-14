--config
config = {
	grid = {
		height = 20,
		width = 10,
		blockWidth = 20,
		blockHeight = 20
	},
	pieces = {
		colors = {
			I = color("#00ffffCC"),
			J = color("#0000ffCC"),
			L = color("#ffff44CC"),
			T = color("#800080CC"),
			Z = color("#FF3333CC"),
			S = color("#00ff00CC"),
			O = color("#ffff00CC")
		},
		texture = "b26"
	},
	buttons = {
		speedUp = "u",
		rotateLeft = "z",
		rotateRight = "x",
		rotate180 = ",",
		drop = " ",
		down = "down",
		up = "up",
		left = "left",
		right = "right",
		hold = "c"
	},
	bgColor = color("#000000CC"),
	emptyColor = color("#333333CC"),
	normalSpeed = 0.5,
	highSpeed = 0.025,
	inputPollingSeconds = 0.25,
	hints = {
		num = 5,
		x = SCREEN_WIDTH / 2 + 100,
		y = -90,
		xSpan = 0,
		ySpan = 90
	},
	holdPiece = {
		x = SCREEN_WIDTH / 2 - 220,
		y = 50
	},
	drawGhostBlocks = true,
	bgTexture = "back00"
}
