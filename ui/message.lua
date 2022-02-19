-- HELPER METHODS

-- creates new Text object with given string
local function message_factory( font, str, limit, padX, padY )
    local text = love.graphics.newText( font, nil )
    text:addf( str, limit - (padX * 2), "left", padX, padY )
    return text
end


-- OBJECT DEFINITION
local message = {}

-- member functions
function message:createNew( parent, font, str, paddingX, paddingY )
    local m = {}
    setmetatable(m, self)
    self.__index = self

    -- given properties
    m.parent = parent
    m.str = str
    m.paddingX = paddingX or 10
    m.paddingY = paddingY or 10

    -- calculated properties
    m.text = message_factory( font, m.str, m.parent.width, m.paddingX, m.paddingY )
    m.width = m.text:getWidth()
    m.height = m.text:getHeight()

    return m
end

function message:update( dt )

end

function message:draw( screenX, screenY )
    love.graphics.draw( self.text, screenX, screenY )
end

return message