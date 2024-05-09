# get the figure and the color by name
extends Node

var blockName = null
var polygon = Polygon2D.new()

var figure_list = {
	"o_block" : PackedVector2Array([Vector2(0, 0), Vector2(0, 2), Vector2(2, 2), Vector2(2, 0)]),
	"i_block" : PackedVector2Array([Vector2(0, 0), Vector2(0, 1), Vector2(4, 1), Vector2(4, 0)]),
	"l_block" : PackedVector2Array([Vector2(0, 0), Vector2(0, 2), Vector2(1, 2), Vector2(1, 1), Vector2(3, 1), Vector2(3, 0)]),
	"j_block" : PackedVector2Array([Vector2(0, 0), Vector2(0, 2), Vector2(3, 2), Vector2(3, 1), Vector2(1, 1), Vector2(1, 0)]),
	"s_block" : PackedVector2Array([Vector2(0, 0), Vector2(0, 2), Vector2(1, 2), Vector2(1, 3), Vector2(2, 3), Vector2(2, 1), Vector2(1, 1), Vector2(1, 0)]),
	"z_block" : PackedVector2Array([Vector2(1, 0), Vector2(3, 0), Vector2(3, 1), Vector2(2, 1), Vector2(2, 2), Vector2(0, 2), Vector2(0, 1), Vector2(1, 1)]),
	"t_block" : PackedVector2Array([Vector2(1, 0), Vector2(2, 0), Vector2(2, 1), Vector2(3, 1), Vector2(3, 2), Vector2(0, 2), Vector2(0, 1), Vector2(1, 1)])
} 
var color_list = {
	"o_block" : Color(.996, .971, .302, 1),
	"i_block" : Color(.318, .882, .988, 1),
	"l_block" : Color(.969, .576, .180, 1),
	"j_block" : Color(.945, .447, .714, 1),
	"s_block" : Color(.918, .239, .122, 1),
	"z_block" : Color(.478, .682, .239, 1),
	"t_block" : Color(.584, .212, .580, 1)
} 

# set the polygon properties based on the block name
func _init(bloxx: String):
    if bloxx not in figure_list.keys():
        printerr("Invalid block name: %s" % bloxx)
        return 
    else:
        self.blockName = bloxx


func get_figure():
    var figure = figure_list[self.blockName]
    var color = color_list[self.blockName]

    return [figure,color]
