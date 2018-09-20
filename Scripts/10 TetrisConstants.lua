blocksByPiece = {
	S = {pos(1, 0), pos(0, 1), pos(1, 1), pos(2, 0), center = pos(1, 1)},
	J = {pos(0, 0), pos(0, 1), pos(1, 1), pos(2, 1), center = pos(1, 1)},
	O = {pos(1, 0), pos(1, 1), pos(2, 0), pos(2, 1), center = pos(1, 1)},
	I = {pos(0, 0), pos(0, 1), pos(0, 2), pos(0, 3), center = pos(0.5, 2)},
	Z = {pos(0, 0), pos(1, 0), pos(1, 1), pos(2, 1), center = pos(1, 1)},
	T = {pos(1, 0), pos(0, 1), pos(1, 1), pos(2, 1), center = pos(1, 1)},
	L = {pos(2, 0), pos(0, 1), pos(1, 1), pos(2, 1), center = pos(1, 1)}
}

wallKickIndexing = {
	{0, 1, 0, 8},
	{2, 0, 3, 0},
	{0, 4, 0, 5},
	{7, 0, 6, 0}
}
commonWallKickData = {
	{pos(0, 0), pos(0, 0), pos(0, 0), pos(0, 0), pos(0, 0), pos(0, 0), pos(0, 0), pos(0, 0)},
	{pos(-1, 0), pos(1, 0), pos(1, 0), pos(-1, 0), pos(1, 0), pos(-1, 0), pos(-1, 0), pos(1, 0)},
	{pos(-1, 1), pos(1, -1), pos(1, -1), pos(-1, 1), pos(1, 1), pos(-1, -1), pos(-1, -1), pos(1, 1)},
	{pos(0, -2), pos(0, 2), pos(0, 2), pos(0, -2), pos(0, -2), pos(0, 2), pos(0, 2), pos(0, -2)},
	{pos(-1, -2), pos(1, 2), pos(1, 2), pos(-1, -2), pos(1, -2), pos(-1, 2), pos(-1, 2), pos(1, -2)}
}
wallKickData = {
	I = {
		{pos(0, 0), pos(0, 0), pos(0, 0), pos(0, 0), pos(0, 0), pos(0, 0), pos(0, 0), pos(0, 0)},
		{pos(-2, 0), pos(2, 0), pos(-1, 0), pos(1, 0), pos(2, 0), pos(-2, 0), pos(1, 0), pos(-1, 0)},
		{pos(1, 0), pos(-1, 0), pos(2, 0), pos(-2, 0), pos(-1, 0), pos(1, 0), pos(-2, 0), pos(2, 0)},
		{pos(-2, -1), pos(2, 1), pos(-1, 2), pos(1, -2), pos(2, 1), pos(-2, -1), pos(1, -2), pos(-1, 2)},
		{pos(1, 2), pos(1, 2), pos(2, -1), pos(-2, 1), pos(1, 2), pos(1, 2), pos(-2, 1), pos(2, -1)}
	},
	J = commonWallKickData,
	L = commonWallKickData,
	T = commonWallKickData,
	Z = commonWallKickData,
	S = commonWallKickData
}
-- for textures
piecesNamesToIndex = {
	I = 5,
	J = 2,
	L = 6,
	T = 7,
	Z = 1,
	S = 4,
	O = 3
}

pieceNames = tableKeys(copyTable(blocksByPiece))
