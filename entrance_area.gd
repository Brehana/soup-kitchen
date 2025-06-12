extends Area2D

@export var scene_path: String

var chef_present = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") && chef_present == true:
		get_tree().change_scene_to_file(scene_path)




func _on_body_entered(body: Node2D) -> void:
	if body is Chef:
		chef_present = true


func _on_body_exited(body: Node2D) -> void:
	if body is Chef:
		chef_present = false
