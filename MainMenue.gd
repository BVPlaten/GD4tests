extends CanvasLayer

var my_dict = {
"PongButton": "res://pong.tscn",
"TetrisButton": "res://tetris.tscn",
"PictureButton": "res://picture.tscn",
"SoundButton": "res://sound.tscn",
"RotadeButton": "res://main.tscn",
"NotAvailableButton": "res://main.tscn"
}

func _ready():
	# Get all the buttons in the CanvasLayer
	var buttons = get_children()
	
	# Loop through each button
	for button in buttons:
		# Check if the node is a Button
		if button is Button:
			print(button.name)
			button.pressed.connect(self._on_button_pressed.bind(button.name))


func _on_button_pressed(arg):
	print("Button %s pressed  for scene %s" % [arg ,  my_dict[arg]])
	get_tree().change_scene_to_file(my_dict[arg])
