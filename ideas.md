# Map connections 

## Idea 1 - Map quadrants and codes 

## Idea 2 - Offset array between maps
If I define an offset between different maps, I can build a function to calculate what the next map will be.
   stage1 = wtx=0,wty=0
   stage2 = wtx=48,wty=0
When the player is on tx=48, ty=10 I can calculate what is the right stage to fall in that offset and build it.
To do this I must memorize the player tile in abstract full tile coords: 
    in stage2 for example p.wtx = 48 but the the p.tx = 0 and when it will be
    at the end of other edge it will be p.wtx = 97
    The wtx can be calculated every frame or only when reaching edges: p.wtx = p.tx + stage.wtx

## stage_changes_map 
Is the same grid as the stage_mem but is used to remember and apply the status of a tile during loading of the stage
Symbols: 
   d: destroyed - the object should not be created
   1: state 1 of the object (for a door can be "open", for a switch can be "on" etc.)
   2: state 2 of the object (for a door can be "closed, for a switch can be "off" etc.)
                            