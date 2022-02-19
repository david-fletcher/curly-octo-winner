-- OBJECT DEFINITION
local container = {}

-- member functions
function container:createNew( screenX, screenY, width, height )
    local c = {}
    setmetatable(c, self)
    self.__index = self

    -- given properties
    c.screenX = screenX
    c.screenY = screenY
    c.width = width
    c.height = height

    c.children = {}

    return c
end

function container:update( dt )

end

-- right now hardcoded to single column; top-bottom layout
function container:draw()
    -- draw a border for debugging
    love.graphics.rectangle( "line", self.screenX, self.screenY, self.width, self.height )

    -- set up the clipping area
    love.graphics.setScissor( self.screenX, self.screenY, self.width, self.height )

    -- draw to the container
    local y = 0
    for _, drawable in ipairs(self.children) do
        if ( y > self.height ) then
            break
        end

        drawable:draw( self.screenX, self.screenY + y )
        y = y + drawable.height + drawable.paddingY
    end

    -- disable the clipping area
    love.graphics.setScissor()
end

function container:appendChild( childDrawable, index )
    childDrawable.parent = self

    -- default to appending to the front
    local idx = index or 1
    table.insert( self.children, idx, childDrawable )
end

return container