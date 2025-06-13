extends CanvasLayer

func _ready() -> void:
	IngredientsTracker.score_updated.connect(update_view)
	update_view()
	
func update_view():
	for ingredient in IngredientsTracker.ingredients_prepared:
		match ingredient.name:
			"Veggie":
				$IngredientsFrame/CarrotSprite/CarrotLabel.text = "x" + str(ingredient.quantity)
			"Meat":
				$IngredientsFrame/MeatSprite/MeatLabel.text = "x" + str(ingredient.quantity)
	$SoupFrame/SoupSprite/SoupLabel.text = "x" + str(IngredientsTracker.soup_prepared.quantity)
