cstarcls = {}

function cstar(name, cls)
    local name, par = unpack(split(name, ":"))
    cstarcls[name] = cls
    cls.__index = cls
    setmetatable(cls, cstarcls[par])
    cls.new = function(...)
        local obj = cls.__new(name, ...)
        obj.__name = name
        setmetatable(obj, cls)
        return obj
    end
    cls.super = cstarcls[par]
    return cls
end