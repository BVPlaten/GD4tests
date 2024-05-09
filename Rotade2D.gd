extends Node

const Factory = preload("res://blockFactory.gd")

var itemSelect      # select-box for the tetromineos
var polygon = Polygon2D.new()
@export var scale_factor = 15.0
@export var rotation_speed = 250

# ToDo !!!!!! ToDo !!!!!! ToDo !!!!!!
# ToDo !!!!!! ToDo !!!!!! ToDo !!!!!! 
var block_name_list = ["o_block","i_block","l_block","j_block","s_block","z_block","t_block"]

# Called when the node enters the scene tree for the first time.
func _ready():
	init_list()
	init_polygon("l_block")
	add_child(polygon)


# rotade the polygon clockwise
func _process(delta):
	polygon.rotate(deg_to_rad(delta * rotation_speed))


func scale_figure(vec):
	var scaled_vector = []
	for vector in vec:
		scaled_vector.append(vector * scale_factor)
	return scaled_vector


func init_list():
	itemSelect = $FigureSelect
	for key in block_name_list:
		itemSelect.add_item(key)
	

func init_polygon(bloxx: String):
	var instance = Factory.new(bloxx)
	var figure_and_color = instance.get_figure()
	polygon.polygon = scale_figure(figure_and_color[0])
	polygon.color = figure_and_color[1]
	polygon.position = Vector2(256, 150)
	polygon.set_antialiased(true)
	


func _on_figure_select_item_selected(index: int) -> void:
	var selector = block_name_list[index]
	print('Your selection was %s !' % selector)
	init_polygon(selector)
