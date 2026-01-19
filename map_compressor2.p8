pico-8 cartridge // http://www.pico-8.com
version 43
__lua__

#include game/common.lua
target_file_path = "./microvania/compressed_maps.lua"

-- Return a string obtained by taking only the odd characters of the input string
function odd_chars(s)
    local res = ""
    for i=1,#s,2 do
        res ..= char_at(s, i)
    end
    return res
end

-- legend:
-- space = empty
-- 1 = solid terrain block
-- 6 = focuslith
-- a = horizontal bat
-- b = vertical bat
-- e = dog enemy
-- f = player start position
-- g = spider enemy
-- h = vines
-- ABCD = fire, thunder,ice,wind scrolls
-- EFGH = fire+1,thunder+1,ice+1,wind+1 scrolls
-- IJKL = fire+2,thunder+2,ice+2,wind+2 scrolls 
-- MNOP = doors activated by switches
-- QRST = switches for doors MNOP
-- XYZ = static shards x1,x3,x5
-- pqrstuvwxyz = npc dialogs (the mapping is done in game_config.lua)

-- empty_map_sammple
empty_map_sample = [[
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1     f                                                                                       1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]]

testing_map_sample = [[
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                     1 1 1 1 1 1 1 1 1 1 1 1                 1
1                                                                                             1
1                                                                                             1
1                                               1 1 1 1                         1 1           1
1                                                                                             1
1                                                                         1 1                 1
1                                                                                             1
1                                                                                             1
1                         1 1     1 1                                           1 1           1
1                     1 1             1 1                                                     1
1                     1 1     1 1     1 1                                 1 1                 1
1                     1 1             1 1                                                     1
1                         1 1     1 1                                           1 1           1
1                             1 1                                                             1
1                                                                         1 1                 1
1                                                                                             1
1                                                                               1 1           1
1                                                                                             1
1         1 1 1                                                           1 1                 1
1   1 1 1 1                                                                                   1
1   1 1   b                         1                                           1 1           1
1   M M 7     Q     u               1                                                         1
1 1 1 1 1 1 1 1 1 1 1 1 1           1                                     1 1                 1
1     a                 1           M                                                         1
1             1 1 1 1   1 1   1 1 1 1                                                         1
1         1 1 1 1                   1 1 1                                 1 1                 1
1 p   f 1 1 1 1 1 6   A B C D       h h h   1               g               1             e   1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]]


extended_maps_config = {[[
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
  b                                     1       X X         1                                  
                                        1   1 1 1 1 1 1                                        
                                        1             1                                        
                                        1 1 1 1 1 1   1                                        
                                                      1                                        
    1                                   1 1 1 1 1 1 1 1 1 1 1                                  
                                      1                     X 1                       1 1 1 1 1
1 1 1 1 1   p     f             6   1                       1                     1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1                       1       1 1 1 1 1 1 1 1 1 1 1 1 1   1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1     g       g             1 1 1 1 1 1 1 1 1 1            
            a                     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1                    
              e                     1 1 1 1 1 1 1 1 1 1 1 1 1 1                                
        1 1 1 1 1 1 1                                                                 1 1 1    
1 1 1 1 1   b                                                                                  
              b         1 1 1                                                                  
                b                   1 1 1   1     1 1 1   1     1 1 1                          
                                                    b                                     1 1 1
                  b                                                     1 1 1                  
                                                                                      1 1 1    
      1 1 1 1 1 1 1 1 1 1                                                                      
      1                 1                                                       1 1 1          
1 1 1 1     1   1   1   1 1                                                                    
                          1         e   e                               1 1 1                  
      1   1   1       1   1 1 1 1 1 1 1 1 1 1 1 1                                              
                                                1         e                                    
    1       a     1 1     1     1               1 1 1 1 1 1 1 1 1 1 1 1 1                      
                                    1               b   b   b   b       1     g                
                                                                        1 1 1 1 1 1 1 1 1 1 1  
1 1         1                                                                               1 1
1 1 1     1 1 1   g                     g             b   b   b   b                            
1 1 1   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]],
[[
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
                                        X                       Y       1 1 1 1 1 1 1 1 1 1 1 1
                                                            1 1 1 1       1 1 1 1 1 1 1 1 1 1 1
                    1 1   a     1 1 1 1   1 a   1 1 1   a                   1 1 1 1 1 1 1 1 1 1
                                                                            1 1 1 1 1 1 1 1 1 1
                                                                            1 1 1 1 1 1 1 1 1 1
        f       1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1         1 1 1 1 1 1 1 1 1 1
                                      b             Z 1 1 1 1 1 1 1   1 1 1 1 1 1 1 1 1 1 1 1 1
                                                          1 1 1 1 1         1 1 1 1 1 1 1 1 1 1
            1     X X X         X X                         1 1 1 1         1 1 1 1 1 1 1 1 1 1
            1   1 1 1 1 1     1 1 1 1   1 1           a       1 1 1   1 1   1 1 1 1 1 1 1 1 1 1
            1                                                   1 1         1 1 1 1 1 1 1 1 1 1
            1                                 1 1               1       1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1     a Z b                                     1           1 1 1 1 1 1 1 1 1 1
                1 1                             b   1 1   a       1 1 a     1 1 1 1 1 1 1 1 1 1
                  1                                               1         1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1     1                                       1 1 1 1 1       1 1 1 1 1 1 1 1 1 1 1
                  1                           1 1   1 1         1           1 1 1 1 1 1 1 1 1 1
                  1 1                           b               1 1 1   a   1 1 1 1 1 1 1 1 1 1
                    1                   1 1                     1           1 1 1 1 1 1 1 1 1 1
                    1 1                                           1     1 1 1 1 1 1 1 1 1 1 1 1
                      1             1 1                           1         1 1 1 1 1 1 1 1 1 1
                      1 1 1                         e           X 1         1 1 1 1 1 1 1 1 1 1
                          1     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 X X   1 1 1 1 1 1 1 1 1 1
                          1 1               1 1 1     1 1 1       1 1 1 1   1 1 1 1 1 1 1 1 1 1
                            1 1               1 1 1     1           1 1     1 1 1 1 1 1 1 1 1 1
                                                                      1   1 1 1 1 1 1 1 1 1 1 1
                              1 1 1 1                                 1     1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1   1 1 1 1 1             1 1               1 1   1 1 1 1 1 1 1 1 1 1
                                      1 1                   g               1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]],
[[
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 1                                     b           b                             1 1 1 1 Z Z 1
1                     g           g           b                                   1 1 1 1 Z   1
1   1 1   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1                     1 1 1 1      
1     a   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1               1 1 1 1      
1     1 1   1 1 1 1 1     1 1 1 1 1 1 1 1 1                       1               1 1 1 1      
1      a      1 1 1                                               1 1 1           1 1 1 1      
1   1 1         1                                                     1           h h h h      
1 a                                                         1 1 1 1 1 1           1 1 1 1 1 1 1
1     1 1             1 1 1 1 1   1   1 1 1 1                       b 1 1 1 1 1 C 1 1 1 1 1 1 1
1    a              1 1 1         1       1 1 1                                 1 1 1 1 1 1 1 1
1   1 1           1 1             1 1   1     1 1                   a           1 1   a        
1               1 1         Q       M   1       1 1                           Z h h            
1 1 1 1 1 1 1 1 1         1 1 1 1 1 1 1 1         1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1            
1           1 1 1                         X X     1 1 A                 b           g     1 1 1
1           1 1 1 6   1 1   1 1     1 1   1 1     1 1 1 1 1           b     1 1 1 1 1 1 1 1    
1 1 1   1       1 1         b         b         1 1                 b     1 1                  
1       1 1       1 1         b 1 1 b         1 1 1   1 1 1 1 1 1 1 1 1 1 1                    
1     1             1 1 1                 1 1 1         1             1               1 1      
1     1               Z 1 1 1 1     1 1 1 1         1   1             1                        
1   1 1 1 1 1 1 1 1 1 1 1 1 1 1     1 1 1               1     1 1     1                        
1                 1 1 1 1 1 1 1 1   1 1 1               1 1     1     1                 g g    
1 1                   1 1 1 1         1 1         1 1     1     1                 1 1 1 1 1 1 1
1                       1 1 1 1 B   1 1 1           1           1               1 1            
1 1 1                   1 1 1 1 1 1 1 1 1 1 1 1     1 1 1 1 1 1 1 1 1 1 1 1 1 1 1              
1                         1 1 1 1 1 1 1     h h     h h       1 1 1       b                    
1 1 1 1     1 1 1 1   1 1 1 1 1 1 1 1       1 1 1 1 1 1       1             b                  
1                 b           1 1 1                                           b                
1 1   1 1 1                     1 1                                             b              
1 1 1                           b                               1                             1
1 1 1 1                   X X     g   e       X X           1 1 1                       f   1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]],
[[
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1         1                                                                       1           1
1         1                                                                       1           1
1 1 1 1   1                               1 1 1 1 1                               1   1 1 1 1 1
1                                                                                             1
1       1 1                         1 1               1 1                           1 1       1
1                                                                                             1
1                               1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1                               1
1 1 1 1 1 1 1 1 1 1 1 1 1                                             1 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1 1                                                 1 1 1 1 1 1 1 1 1 1 1 1
1 1 1 1 1 1 1 1 1 1 1     1 1                                     1 1     1 1 1 1 1 1 1 1 1 1 1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1                                                                                             1
1 1 1 1 1 1 1 1 1 1 1                                                       1 1 1 1 1 1 1 1 1 1
1 1   1   1   1   1   1                                                   1   1   1   1   1   1
1   1   1   1   1   1   1                                               1   1   1   1   1   1 1
1 1   1   1   1   1   1   1                                           1   1   1   1   1   1   1
1   1   1   1   1   1   1   1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1   1   1   1   1   1   1 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
]]
}

function compress_map(str)
    local compressed = ""
    local last_tile = nil
    local count = 0
    
    -- clean the string: remove newlines
    -- (pico-8 newlines can be \n or \r depending on editor)
    local clean_str = ""
    for i=1, #str do
        local c = sub(str, i, i)
        if (c != "\n" and c != "\r") then 
            clean_str = clean_str..c
        else 
            -- add a last space at the end of line instead of new line
            clean_str = clean_str.." "
        end
    end

    -- iterate 2 characters at a time
    for i=1, #clean_str, 2 do
        -- grab the pair, e.g., "1 " or "  "
        local pair = sub(clean_str, i, i+1)
        
        -- convert pair to single tile character
        -- "  " (double space) becomes "0" (empty)
        -- "1 " (digit+space) becomes "1"
        local tile = "0"
        if (pair != "  ") tile = sub(pair, 1, 1)
        
        -- rle logic
        if tile == last_tile and count < 90 then
            count = count + 1
        else
            if (last_tile) then
                -- add to string: TILE + COUNT_CHAR
                -- we add 32 to count to make it a printable ascii char
                compressed = compressed .. last_tile .. chr(count + 32)
            end
            last_tile = tile
            count = 1
        end
    end
    -- flush final set
    if (last_tile) compressed = compressed .. last_tile .. chr(count + 32)
    
    return compressed
end

cls()
content = "stage_compressed_maps = {\n"
for m in all(extended_maps_config) do
    local result = compress_map(m)
    content = content.."\t[["..result.."]],\n"
end
content = content.."}\n"
printh(content, "@clip")
print("data copied to clipboard!")
