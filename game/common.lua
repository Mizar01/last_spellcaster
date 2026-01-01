c_timer = {
    new = function(secs, loop)
        local l = {
            maxtime = flr(fps * secs),
            t = flr(fps * secs),
            loop = loop or false,
        }
        setmetatable(l, c_timer)
        return l
    end,
    adv = function(self)
        if (self.t < 0) return false  -- the timer no longer counts
        self.t -= 1
        local triggered = false
        if (self.t == 0) then
            triggered = true
            if (self.loop) then
                self.t = self.maxtime
            else
                self.t = -1  -- stop the timer
            end
        end
        return triggered
    end,
    restart = function(self)
        self.t = self.maxtime
    end,
    seconds_left = function(self) return flr(self.t / fps) end,
        
}
c_timer.__index = c_timer

function testcontroller_draw()

    glyphs={"\139","\145","\148","\131","\142","\151"}
    --cls()
    for pi=0,8 do
        print(''..pi..':', 0, pi*7, 1)
        for b=0,6 do
			if btn(b,pi) then
				print(glyphs[b+1], b*8 + 10, pi*7, pi+1)
			end
      	end
    end
end

function test_point(x, y)
    -- draw a rectangle centered at (x, y)
    rect(x-1, y-1, x+1, y+1, 8)
end

-- Get the tile at pixel coordinates (x, y) given the size of a single tile (tw, th)
function mget2_by_px(x, y, tw, th)
    tw = tw or 8
    th = th or 8
    local tx = flr(x / tw)
    local ty = flr(y / th)
    return {
        tile = mget(tx, ty), -- tile index
        tx = tx,      -- tile x 
        ty = ty,      -- tile y
        ox = tx * tw,  -- origin x in pixels
        oy = ty * th,  -- origin y in pixels
    }
end

function fget_by_px(x, y, fidx, tw, th)
    local mtile = mget2_by_px(x, y, tw, th)
    return fget(mtile.tile, fidx)
end

--- Draw a progress bar representing a timer
function progress_bar_timer_draw(timer, x, y, w, h, col_bg, col_fg)
    if (timer == nil) return
    local v = timer.t
    local max_v = timer.maxtime
    progress_bar_draw(x, y, w, h, v, max_v, col_bg, col_fg)
end

function progress_bar_draw(x, y, w, h, v, max_v, col_bg, col_fg)
    rectfill(x - 1, y - 1, x + w + 1, y + h + 1, col_bg) -- bg
    local filled_w = mid(0, flr((v / max_v) * w), w)
    rectfill(x, y, x + filled_w, y + h, col_fg) -- fg
end

function datetime_str()
    local d = stat(90).."-"..stat(91).."-"..stat(92)
    local h = stat(93)..":"..stat(94)..":"..stat(95)
    return d.." "..h
end

-- To use this better to configure log path in config.lua of the specific game
function flog(msg)
    local log_enabled = log_enabled or false
    if (not log_enabled) then return end
	printh(msg, log_filename or "mainlog")
end

-- prints centered text to the x position
function cprint(msg, x, y, col)
    print(msg, x - #msg * 2, y, col)
end

function crectfill(x, y, w, h, col)
    rectfill(x - w / 2, y - h / 2, x + w / 2, y + h / 2, col)
end

-- get the next array element every given time interval (in seconds)
function adv_timed_arr(interval, arr)
    return arr[flr(time() / interval) % #arr + 1]
end

-- Usage prevIdx, prevVal = prevItem(arr, curr_idx)
-- Useful to get navigate back and forth into array and the corresponding item
--   Ex.  self.currentIdx, v = prevItem(arr, self.currentIdx)
function prev_item(arr, curr_idx)
    local cnts = #arr
    local prev_idx = curr_idx == 1 and cnts or curr_idx - 1
    return prev_idx, arr[prev_idx]
end

-- Usage nextIdx = nextItem(arr, curr_idx)
function next_item(arr, curr_idx)
    local cnts = #arr
    local next_idx = (curr_idx % cnts) + 1
    return next_idx, arr[next_idx]
end

function join(d,s)
    local f = ""
    for v in all(s) do
        f..=d..v
    end
    return f or ''
end

function char_at(s, i)
    return sub(s, i, i)
end

-- 0-based matrix map
function matrix_map(w, h, default_val)
    local mat = {}
    for y=0,h-1 do
        mat[y] = {}
        for x=0,w-1 do
            mat[y][x] = default_val
        end
    end
    return mat
end

-- t must be in [0,1]
function lerp(a,b,t)
    local result=a+t*(b-a)
    return result
end

-- Prints multiple lines of text, centered or not centered
-- the lines are splitted using "*" char
function mlprint(msg, x, y, color, centered)
    local s = split(msg, "*")
    for i=1,#s do
        local m = s[i]
        -- local px = x - (4 * #m / 2)
        if (centered) then
            cprint(m, x, y / 2 + (i-1) * 8 + 5, color)
        else
            print(m, x, y + (i-1) * 8, color)
        end
    end
end

function contains(tbl, val)
    for v in all(tbl) do
        if (v == val) then
            return true
        end
    end
    return false
end

function class_inherit(derived, base)
    derived.__index = derived
    setmetatable(derived,base)
end