extends Node

var itemSelect      # select-box for the tetromineos
var polygon = Polygon2D.new()
var scale_factor = 35.0
var tetrominoes = {
	"o_tetrominoes" : PackedVector2Array([Vector2(0, 0), Vector2(0, 2), Vector2(2, 2), Vector2(2, 0)]),
	"i_tetrominoes" : PackedVector2Array([Vector2(0, 0), Vector2(0, 1), Vector2(4, 1), Vector2(4, 0)]),
	"l_tetrominoes" : PackedVector2Array([Vector2(0, 0), Vector2(0, 2), Vector2(1, 2), Vector2(1, 1), Vector2(3, 1), Vector2(3, 0)]),
	"j_tetrominoes" : PackedVector2Array([Vector2(0, 0), Vector2(0, 2), Vector2(3, 2), Vector2(3, 1), Vector2(1, 1), Vector2(1, 0)]),
	"s_tetrominoes" : PackedVector2Array([Vector2(0, 0), Vector2(0, 2), Vector2(1, 2), Vector2(1, 3), Vector2(2, 3), Vector2(2, 1), Vector2(1, 1), Vector2(1, 0)]),
	"z_tetrominoes" : PackedVector2Array([Vector2(1, 0), Vector2(3, 0), Vector2(3, 1), Vector2(2, 1), Vector2(2, 2), Vector2(0, 2), Vector2(0, 1), Vector2(1, 1)]),
	"t_tetrominoes" : PackedVector2Array([Vector2(1, 0), Vector2(2, 0), Vector2(2, 1), Vector2(3, 1), Vector2(3, 2), Vector2(0, 2), Vector2(0, 1), Vector2(1, 1)])
} 
var colorList = {
	"o_tetrominoes" : Color(.996, .971, .302, 1),
	"i_tetrominoes" : Color(.318, .882, .988, 1),
	"l_tetrominoes" : Color(.969, .576, .180, 1),
	"j_tetrominoes" : Color(.945, .447, .714, 1),
	"s_tetrominoes" : Color(.918, .239, .122, 1),
	"z_tetrominoes" : Color(.478, .682, .239, 1),
	"t_tetrominoes" : Color(.584, .212, .580, 1)
} 

# Called when the node enters the scene tree for the first time.
func _ready():
	polygon.polygon = scaleFigure(tetrominoes["t_tetrominoes"])
	polygon.color = Color(1, .2, .2)
	polygon.position = Vector2(256, 150)
	polygon.set_antialiased(true)
	add_child(polygon)
	initLst()


func scaleFigure(vec):
	var scaled_vector = []
	for vector in vec:
		scaled_vector.append(vector * scale_factor)
	return scaled_vector


# rotade the polygon clockwise
func _process(delta):
	polygon.rotate(deg_to_rad(delta * 115))


func initLst():
	itemSelect = $FigureSelect
	for key in tetrominoes:
		itemSelect.add_item(key)
	

func _on_figure_select_item_selected(index: int) -> void:
	print(tetrominoes.keys()[index])
	print(colorList[colorList.keys()[index]])
	polygon.polygon = scaleFigure(tetrominoes[tetrominoes.keys()[index]])
	#polygon.color = colorList[colorList.keys()[index]]
	var color = colorList[colorList.keys()[index]]
	polygon.color = color
