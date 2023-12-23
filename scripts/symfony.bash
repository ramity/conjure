#!/bin/bash

DIR=/root/symfony

cd $DIR || exit

# Ensure DIR is owned by root to avoid dubious ownership error
chown -R root:root $DIR

# Clear symfony directory
rm ${DIR:?}/* -r -d
rm $DIR/.*

# Create symfony project
symfony new conjure --webapp --dir=$DIR --no-git

# Cleanup post generation
touch $DIR/.gitkeep
# rm $DIR/.git -r -d

# Drop database if exists and create fresh
bin/console d:d:d --if-exists --force
bin/console d:d:c

# User entity
echo -e "yes\nuuid\nyes\n" | bin/console make:user User

# Unit entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity Unit
echo -e "abbreviation\nstring\n255\nno\n\n" | bin/console make:entity Unit

# Nutrtition entity
echo -e "servingSizeQuantity\nfloat\nno\n\n" | bin/console make:entity Nutrition
echo -e "servingSizeUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "altServingSizeQuantity\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "altServingSizeUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "servingsPerContainer\nfloat\nno\n\n" | bin/console make:entity Nutrition
# - Calories
echo -e "calories\nfloat\nno\n\n" | bin/console make:entity Nutrition
echo -e "caloriesFromFat\nfloat\nno\n\n" | bin/console make:entity Nutrition
# - Fats
echo -e "totalFat\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "totalFatUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "saturatedFat\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "saturatedFatUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "transFat\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "transFatUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "cholesterol\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "cholesterolUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
# - Carbs
echo -e "totalCarbohydrates\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "totalCarbohydratesUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "dietaryFiber\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "dietaryFiberUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "totalSugars\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "totalSugarsUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "addedSugars\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "addedSugarsUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "otherCarbohydrates\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "otherCarbohydratesUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
# - Protein
echo -e "protein\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "proteinUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
# - Vitamins
echo -e "vitaminA\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "vitaminAUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "vitaminC\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "vitaminCUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "vitaminD\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "vitaminDUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "vitaminE\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "vitaminEUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "vitaminK\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "vitaminKUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
# - Vitamin B variants
echo -e "thiamine\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "thiamineUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "riboflavin\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "riboflavinUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "niacin\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "niacinUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "pantothenicAcid\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "pantothenicAcidUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "pyridoxine\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "pyridoxineUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "biotin\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "biotinUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "folate\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "folateUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "cobalamin\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "cobalaminUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
# - Elements
echo -e "sodium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "sodiumUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "calcium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "calciumUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "iron\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "ironUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "phosphorus\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "phosphorusUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "potassium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "potassiumUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "magnesium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "magnesiumUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "copper\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "copperUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "manganese\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "manganeseUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "chromium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "chromiumUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "selenium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "seleniumUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity Nutrition

# Ingredient entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity Ingredient
echo -e "brand\nstring\n255\nyes\n\n" | bin/console make:entity Ingredient
echo -e "nutrition\nrelation\nNutrition\nManyToOne\nyes\nno\n" | bin/console make:entity Ingredient

# IngredientSubstitution entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity IngredientSubstitution
echo -e "predecessor\nrelation\nIngredient\nManyToOne\nyes\nno\n\n" | bin/console make:entity IngredientSubstitution
echo -e "predecessorQuantity\nfloat\nyes\n\n" | bin/console make:entity IngredientSubstitution
echo -e "predecessorUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity IngredientSubstitution
echo -e "replacement\nrelation\nIngredient\nManyToOne\nyes\nno\n\n" | bin/console make:entity IngredientSubstitution
echo -e "replacementQuantity\nfloat\nyes\n\n" | bin/console make:entity IngredientSubstitution
echo -e "replacementUnit\nrelation\nUnit\nManyToOne\nyes\nno\n\n" | bin/console make:entity IngredientSubstitution

# Recipe entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity Recipe
echo -e "ingredients\nrelation\nIngredient\nManyToMany\nno\n\n" | bin/console make:entity Recipe
echo -e "possibleIngredientSubstitutions\nrelation\nIngredientSubstitution\nManyToMany\nno\n\n" | bin/console make:entity Recipe
echo -e "steps\ntext\nno\n\n" | bin/console make:entity Recipe

# Meal entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity Meal
echo -e "brand\nstring\n255\nyes\n\n" | bin/console make:entity Meal
echo -e "ingredients\nrelation\nIngredient\nManyToMany\nno\n" | bin/console make:entity Meal
echo -e "nutrition\nrelation\nNutrition\nManyToOne\nyes\nno\n" | bin/console make:entity Meal

# MealPlan entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity MealPlan
echo -e "meals\nrelation\nMeal\nManyToMany\nno\n\n" | bin/console make:entity MealPlan

# MealInstance entity
echo -e "meal\nrelation\nMeal\nManyToMany\nno\n\n" | bin/console make:entity MealInstance

# FridgeTransaction entity
echo -e "ingredient\nrelation\nIngredient\nManyToOne\nyes\nno\n\n" | bin/console make:entity FridgeTransaction
echo -e "quantity\nfloat\nyes\n\n" | bin/console make:entity FridgeTransaction
echo -e "createdAt\nrelation\nIngredient\nManyToMany\nno\n\n" | bin/console make:entity FridgeTransaction

# GroceryTrip entity
echo -e "ingredients\nrelation\nIngredient\nManyToMany\nno\n\n" | bin/console make:entity GroceryTrip

# Fridge entity
echo -e "ingredientInputs\nrelation\nFridgeTransaction\nManyToMany\nno\n\n" | bin/console make:entity Fridge
echo -e "ingredientOutputs\nrelation\nFridgeTransaction\nManyToMany\nno\n\n" | bin/console make:entity Fridge

# Validate entity definitions
bin/console d:s:v
