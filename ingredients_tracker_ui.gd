extends CanvasLayer

func _ready() -> void:
	IngredientsTracker.score_updated.connect(update_view)
	
func update_view(record: IngredientRecord):
	match record.name:
		"Veggie":
			$IngredientsFrame/CarrotSprite/CarrotLabel.text = "x" + str(record.quantity)
		"Meat":
			$IngredientsFrame/MeatSprite/MeatLabel.text = "x" + str(record.quantity)
		"Pot":
			$IngredientsFrame/PotSprite/PotLabel.text = "x" + str(record.quanitity)
