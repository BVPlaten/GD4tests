extends CanvasLayer

# instance of Navigation script for changing current script
const Navi = preload("res://Navigation.gd")
var nvgtn = Navi.new()

# add desrtination scene to buttons
func _ready():
	for button in get_children():
		# Check if the node is a Button
		if button is Button:
			print(button.name)
			button.pressed.connect(self._on_button_pressed.bind(button.name))

# Change the current scene if button is pressed
func _on_button_pressed(arg):
	var scene_destination = nvgtn.get_scene(arg)
	if scene_destination == null:
		print("Button %s is not available" % arg)
		return
	print("Button %s was pressed for destination.scene %s" % [arg ,  scene_destination])
	get_tree().change_scene_to_file(scene_destination)
