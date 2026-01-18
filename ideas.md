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
                            