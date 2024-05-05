extends Node

var polygon = Polygon2D.new()

var figuren = {
    "quadrat": PackedVector2Array([Vector2(0, 0), Vector2(33, 0), Vector2(33, 33), Vector2(0, 33)]),
    "dreieck": PackedVector2Array([Vector2(0, 0), Vector2(33, 0), Vector2(33, 33)]),
    "l_form": PackedVector2Array([Vector2(0, 0), Vector2(0, 100), Vector2(25, 100), Vector2(25, 0)]),
    "umgekehrte_l_form": PackedVector2Array([Vector2(0, 33), Vector2(33, 33), Vector2(66, 33), Vector2(66, 0)]),
    "s_form": PackedVector2Array([Vector2(0, 33), Vector2(33, 33), Vector2(33, 0), Vector2(66, 0)]),
    "umgekehrte_s_form": PackedVector2Array([Vector2(0, 0), Vector2(33, 0), Vector2(33, 33), Vector2(66, 33)]),
    "t_form": PackedVector2Array([Vector2(0, 0), Vector2(33, 0), Vector2(66, 0), Vector2(33, 33)]),
    "gerade_form": PackedVector2Array([Vector2(0, 0), Vector2(0, 33), Vector2(0, 66), Vector2(0, 99)])
}


# Called when the node enters the scene tree for the first time.
func _ready():
	# polygon.polygon = PackedVector2Array([Vector2(0, 0), Vector2(33, 0), Vector2(33, 33), Vector2(0, 33)])
	polygon.polygon = figuren["l_form"]
	polygon.color = Color(1.0, 0.2, 0.2)
	polygon.position = Vector2(256, 150)
	polygon.set_antialiased(true)
	add_child(polygon)


# rotade the polygon clockwise
func _process(delta):
	polygon.rotate(deg_to_rad(delta * 115))
