extends Node

signal score_updated(record: IngredientRecord)
##Used for weighted RNG machine used in Catch The Ingredients.
@export var ingredients_prepared: Array[IngredientRecord]
##Result of Catch The Ingredients
@export var pot_preapared: IngredientRecord = IngredientRecord.new("Pot", "N/A", 0)
##Result of cooking the soup pot
@export var soup_prepared: IngredientRecord = IngredientRecord.new("Soup", "N/A", 0)

##Adds ingredient. Behaves differently based on which ingredient is added.
##[!]: The ingredients_prepared array needs to remain sorted descending so 
##		it can be used in weighted RNG machines.
func add_ingredient(new_ingredient: IngredientRecord):
	#Add to ingredient_prepared.
	#Add quantity to existing instance, if it exists
	var exists = false
	
	for ingredient in ingredients_prepared:
		if new_ingredient.name == ingredient.name:
			ingredient.quantity = ingredient.quantity + new_ingredient.quantity
			score_updated.emit(ingredient)
			exists = true
	#else add instance
	if exists == false:
		ingredients_prepared.append(new_ingredient)
	
	#sort descending by quantity
	ingredients_prepared.sort_custom(func(a, b): return a.quantity > b.quantity)

##Decrements the quantity of an ingredients record
func remove_ingredient(the_ingredient: IngredientRecord):
	for ingredient in ingredients_prepared:
		if the_ingredient.name == ingredient.name:
			ingredient.quantity = clamp(ingredient.quantity - the_ingredient.quantity, 0, 999)
			score_updated.emit(ingredient)
	#sort descending by quantity
	ingredients_prepared.sort_custom(func(a, b): return a.quantity > b.quantity)
	
