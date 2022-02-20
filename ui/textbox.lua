-- creates new Text object with given string
local function message_factory( font, str, limit, padX, padY )
    local text = love.graphics.newText( font, nil )
    text:addf( str, limit - (padX * 2), "left", padX, padY )
    return text
end

-- OBJECT DEFINITION
local textbox = {}

-- member functions
function textbox:createNew( parent, font, paddingX, paddingY )
    local t = {}
    setmetatable(t, self)
    self.__index = self

    -- given properties
    t.parent = parent
    t.str = ""
    t.paddingX = paddingX or 10
    t.paddingY = paddingY or 10

    -- calculated properties
    t.text = message_factory( font, t.str, t.parent.width, t.paddingX, t.paddingY )
    t.width = t.text:getWidth()
    t.height = t.text:getHeight()

    return t
end

function textbox:update( dt )

end

function textbox:updateString()
    self.text:setf( self.str, self.parent.width - (self.paddingX * 2), "left" )
    self.width = self.text:getWidth()
    self.height = self.text:getHeight()
end

function textbox:draw( screenX, screenY )
    love.graphics.draw( self.text, screenX + self.paddingX, screenY + self.paddingY )
end

return textbox