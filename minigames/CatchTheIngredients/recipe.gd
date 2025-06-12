extends Node2D

##A recipe that can be filled by collecting ingredients in a pot.

signal recipe_completed

var meat_required
var veggies_required

var meat_collected = 0
var veggies_collected = 0

func _ready() -> void:
	generate_recipe()

func generate_recipe():
	var meat_max = 0
	var veggie_max = 0
	#Collect quantities of ingredients
	for ingredient in IngredientsTracker.ingredients_prepared:
		match ingredient.name:
			"Veggie":
				veggie_max = ingredient.quantity
			"Meat":
				meat_max = ingredient.quantity

	meat_required = randi_range(1, clampi(5, 1, meat_max))
	veggies_required = randi_range(1, clampi(5, 1, veggie_max))
	$AnimationPlayer.play("flip")
	update_view()

func collect_veggie():
	veggies_collected += 1
	if(veggies_collected > veggies_required):
		generate_recipe()
		reset()
		return
	elif(veggies_collected == veggies_required && meat_collected == meat_required):
		IngredientsTracker.add_soup(IngredientRecord.new("Soup", "N/A", 1))
		IngredientsTracker.remove_ingredient(IngredientRecord.new("Veggie", "res://minigames/CatchTheIngredients/VegetableIngredient.tscn", veggies_required))
		IngredientsTracker.remove_ingredient(IngredientRecord.new("Meat", "res://minigames/CatchTheIngredients/MeatIngredient.tscn", meat_required))
		generate_recipe()
		reset()
		return
	update_view()

func collect_meat():
	meat_collected += 1
	if(meat_collected > meat_required):
		generate_recipe()
		reset()
		return
	elif(veggies_collected == veggies_required && meat_collected == meat_required):
		IngredientsTracker.add_soup(IngredientRecord.new("Soup", "N/A", 1))
		IngredientsTracker.remove_ingredient(IngredientRecord.new("Veggie", "res://minigames/CatchTheIngredients/VegetableIngredient.tscn", veggies_required))
		IngredientsTracker.remove_ingredient(IngredientRecord.new("Meat", "res://minigames/CatchTheIngredients/MeatIngredient.tscn", meat_required))
		generate_recipe()
		reset()
	update_view()

func update_view():
	$Background/VeggieSprite/VeggieLabel.text = str(veggies_collected) + "/" + str(veggies_required)
	$Background/MeatSprite/MeatLabel.text = str(meat_collected) + "/" + str(meat_required)

func reset():
	veggies_collected = 0
	meat_collected = 0
	generate_recipe()
	update_view()
