class_name Navigation 
extends Node

# dict with the navigation path used for the buttonNames
var _nav_dict = {
"PongButton": "res://pong.tscn",
"TetrisButton": "res://tetris.tscn",
"PictureButton": "res://picture.tscn",
"SoundButton": "res://sound.tscn",
"RotadeButton": "res://main.tscn",
"NotAvailableButton": "res://main.tscn"
}

func get_scene(param):
    if _nav_dict.has(param):
        return _nav_dict[param]
    else:
        return null


    


