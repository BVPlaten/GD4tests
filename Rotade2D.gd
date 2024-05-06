extends Node

var itemSelect      # select-box for the tetromineos

var polygon = Polygon2D.new()

var tetrominoes = {
    "o_tetrominoes" : PackedVector2Array([Vector2(0, 0), Vector2(0, 20), Vector2(20, 20), Vector2(20, 0)]),
    "i_tetrominoes" : PackedVector2Array([Vector2(0, 0), Vector2(0, 10), Vector2(40, 10), Vector2(40, 0)]),
    "s_tetrominoes" : PackedVector2Array([Vector2(0, 0), Vector2(0, 20), Vector2(10, 20), Vector2(10, 30), Vector2(20, 30), Vector2(20, 10), Vector2(10, 10), Vector2(10, 0)]),
    "z_tetrominoes" : PackedVector2Array([Vector2(10, 0),Vector2(30, 0), Vector2(30, 10), Vector2(20, 10), Vector2(20, 20), Vector2(0, 20), Vector2(0, 10), Vector2(10, 10)]),
    "l_tetrominoes" : PackedVector2Array([Vector2(0, 0), Vector2(0, 20), Vector2(10, 20), Vector2(10, 10), Vector2(30, 10), Vector2(30, 0)]),
    "j_tetrominoes" : PackedVector2Array([Vector2(0, 0), Vector2(0, 20), Vector2(30, 20), Vector2(30, 10), Vector2(10, 10), Vector2(10, 0)]),
    "t_tetrominoes" : PackedVector2Array([Vector2(10, 0), Vector2(20,0), Vector2(20,10), Vector2(30, 10), Vector2(30, 20), Vector2(0, 20), Vector2(0, 10), Vector2(10, 10)])
} 

# Called when the node enters the scene tree for the first time.
func _ready():
	polygon.polygon = tetrominoes["o_tetrominoes"]
	polygon.color = Color(1.0, 0.2, 0.2)
	polygon.position = Vector2(256, 150)
	polygon.set_antialiased(true)
	add_child(polygon)
	itemSelect = get_node("ItemList")
	initLst()



# rotade the polygon clockwise
func _process(delta):
	polygon.rotate(deg_to_rad(delta * 115))

func initLst():
	for key in tetrominoes:
		itemSelect.add_item(key)
	itemSelect.select(0, true)


func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	print(tetrominoes.keys()[index-1])
	polygon.polygon = tetrominoes[tetrominoes.keys()[index-1]]
