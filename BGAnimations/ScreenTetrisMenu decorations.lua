local Widg = {}
Widg.defaults = {}

function fillNilTableFieldsFrom(table1, defaultTable)
	 for key,value in pairs(defaultTable) do
		if table1[key] == nil then
			table1[key] = defaultTable[key]
		end
	end
end

Widg.defaults.label = {
	x=0,
	y=0,
	scale=1.0,
	text="Label",
	name="Common Normal",
	width=false,
	color=color("#FFFFFF"),
	onInit=false
}
Widg.Label = function(params)
	fillNilTableFieldsFrom(params, Widg.defaults.label)
	return LoadFont(params.name) .. {
		InitCommand=function(self)
			self:xy(params.x, params.y):zoom(params.scale)
			if width then
				self:maxwidth(params.width)
			end
			if params.onInit then params.onInit(self) end
		end,
		BeginCommand=function(self)
			self:settext(params.text):diffuse(params.color)
		end
	}
end

Widg.defaults.rectangle = {
	x = 0,
	y = 0,
	width = 100,
	height = 100,
	color = color("#FFFFFF"),
	onClick = false,
	onInit = false,
	alpha = 1.0,
	halign = 0.5,
}
Widg.Rectangle = function(params)
	fillNilTableFieldsFrom(params, Widg.defaults.rectangle)
	return Def.Quad {
			InitCommand=function(self)
				self:xy(params.x + params.width/2,params.y + params.height/2):zoomto(params.width,params.height):diffusealpha(params.alpha):halign(params.halign)
				if params.onInit then params.onInit(self) end
			end;
			OnCommand=function(self)
				self:diffuse(params.color)
			end;
			LeftClickMessageCommand=function(self)
				if params.onClick and isOver(self) then
					params.onClick()
				end
			end,
		}
end


Widg.defaults.borders = {
	x = 0,
	y = 0,
	color = color("#FFFFFF"),
	width = 100,
	height = 100,
	borderWidth = 10,
	onInit =false,
	valign = 0,
	alpha = 1.0,
}
Widg.Borders = function(params)
	fillNilTableFieldsFrom(params, Widg.defaults.borders)
	return Def.ActorFrame {
		InitCommand=function(self)
			self:xy(params.x,params.y):valign(params.valign)
			if params.onInit then params.onInit(self) end
		end,
		--4 border quads
		Widg.Rectangle({width=params.borderWidth, height=params.height, color=params.color, alpha=params.alpha}), --left
		Widg.Rectangle({width=params.width, height=params.borderWidth, color=params.color, alpha=params.alpha}), --top
		Widg.Rectangle({x=params.width-params.borderWidth, width=params.borderWidth, height=params.height, color=params.color, alpha=params.alpha}), --right
		Widg.Rectangle({y=params.height-params.borderWidth, width=params.width, height=params.borderWidth, color=params.color, alpha=params.alpha}), --bottom
	}
end

local function highlight(self)
	self:queuecommand("Highlight")
end

Widg.defaults.button = {
	x = 0,
	y = 0,
	width = 50,
	height = 20,
	bgColor = Color.Black,
	border = {
		color = Color.Blue,
		width = 2,
	},
	highlight = {
		color=Color.Purple,
		alpha=1.0,
	},
	highlightColor = false,
	onClick = false,
	onInit = false,
	onHighlight = false,
	onUnhighlight = false,
	alpha = 1.0,
	highlightAlpha = 1.0,
	text = "Button",
	font = {
		scale = 0.5,
		name = "Common Large",
		color = Color.White,
		padding = {
			x = 10,
			y = 10,
			halign = 0.5
		}
	},
}
Widg.Button = function(params, data)
	fillNilTableFieldsFrom(params, Widg.defaults.button)
	local rect = Widg.Rectangle {
		x = params.y,
		y = params.x,
		width = params.width,
		height = params.height,
		color = params.bgColor,
		alpha = params.alpha,
		onClick = params.onClick and function(s) params.onClick(s,data) end or false,
	}
	rect.HighlightCommand=function(self)
		if isOver(self) then
			if params.highlight.color then self:diffuse(params.highlight.color) end 
			if params.highlight.alpha then self:diffusealpha(params.highlight.alpha) end 
			if params.onHighlight then params.onHighlight(self, data) end
		else
			self:diffuse(params.bgColor):diffusealpha(params.alpha)
			if params.onUnhighlight then params.onUnhighlight(self, data) end
		end
	end
	local borders = Widg.Borders {
		x = params.y,
		y = params.x,
		color = params.border.color,
		width = params.width,
		height = params.height,
		borderWidth = params.border.width,
		alpha = params.alpha,
	}
	return Def.ActorFrame {
		InitCommand= function(self) 
			self:SetUpdateFunction(highlight)
			self.params = params 
		end,
		rect,
		Widg.Label {x=params.x+params.font.padding.x,y=params.y+params.font.padding.y,scale=params.font.scale,halign=0.5,text=params.text,width=params.width-params.font.padding.x/2},
		borders
	}
end
return Def.ActorFrame { Widg.Button {onClick=function() output({}) end } }