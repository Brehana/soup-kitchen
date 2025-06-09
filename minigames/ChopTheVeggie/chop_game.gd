extends Minigame

##Driver for ChopTheVegetables.

##Wait a little bit before spawning new vegetable.
func _on_choppable_fully_chopped() -> void:
	IngredientsTracker.add_ingredient(IngredientRecord.new("Veggie", "res://minigames/CatchTheIngredients/VegetableIngredient.tscn", 1))
	$ChoppableRespawnTimer.start()

##Spawn new vegetable.
func _on_choppable_respawn_timer_timeout() -> void:
	var scene = load("res://minigames/ChopTheVeggie/Carrot.tscn")
	var instance = scene.instantiate()
	get_tree().current_scene.add_child(instance)
	instance.fully_chopped.connect(_on_choppable_fully_chopped)
