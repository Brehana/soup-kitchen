extends CanvasLayer

func _ready() -> void:
	for ingredient in IngredientsTracker.ingredients_prepared:
		match ingredient.name:
			"Veggie":
				$"Summary Message/VegetableLabel".text = "Veggies: " + str(ingredient.quantity)
			"Meat":
				$"Summary Message/MeatLabel".text = "Meat: " + str(ingredient.quantity) 
	$"Summary Message/SoupLabel".text = "Soup: " + str(IngredientsTracker.soup_prepared.quantity)
	


func _on_restart_pressed() -> void:
	IngredientsTracker.reset()
	get_tree().change_scene_to_file("res://minigames/ChopTheVeggie/Main.tscn")
