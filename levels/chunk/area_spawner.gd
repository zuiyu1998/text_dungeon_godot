extends RefCounted
class_name AreaSpawner


func get_1() -> Array[Tile]:
    var tiles: Array[Tile] = []
    for x in range(0, 5):
        for y in range(0, 5):
            var tile = Tile.new()
            tile.x = x + 1
            tile.y = y + 1
            tiles.push_back(tile)


    return tiles

# 格子大小
var tile_sizes: Array[int] = [1, 2, 3, 4, 5]


func spawn_tiles() -> Array[Tile]:
    return get_1()
    

class Tile:
    var x: int = 0
    var y: int = 0
