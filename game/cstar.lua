cstarcls = {}
function supercls(name) 
    return cstarcls[name].super 
end

function cstar(name, par, fnlist)
    local cls = fnlist or {}
    cstarcls[name] = cls
    cls.__index = cls
    setmetatable(cls, cstarcls[par])
    cls.new = function(...)
        local obj = cls.__new and cls.__new(name, ...) or {}
        obj.__name = name
        setmetatable(obj, cls)
        return obj
    end
    cls.super = cstarcls[par]
    return cls
end