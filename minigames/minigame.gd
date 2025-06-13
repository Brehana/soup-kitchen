class_name Minigame extends Node2D

var seconds_until_end = 60
var seconds_passed = 0

@export var next_game_filepath: String

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("return_to_kitchen")):
		get_tree().change_scene_to_file("res://GameScene.tscn")
		
func _on_game_timer_timeout() -> void:
	$TimeLabel.text = str(seconds_passed)
	seconds_passed += 1
	if( seconds_passed == seconds_until_end):
		get_tree().change_scene_to_file(next_game_filepath)
