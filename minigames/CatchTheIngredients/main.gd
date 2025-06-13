extends Minigame

@export var next_game_filepath: String

func advance_game():
	get_tree().root.change_scene_to_file
	
