#!/bin/bash

DIR=/root/symfony

cd $DIR || exit

# Ensure DIR is owned by root to avoid dubious ownership error
chown -R root:root $DIR

# Clear symfony directory
rm ${DIR:?}/* -r -d
rm $DIR/.*

# Create symfony project
symfony new conjure --webapp --dir=$DIR

# Cleanup post generation
touch $DIR/.gitkeep
rm $DIR/.git -r -d

# Add deps
composer require ramity/conjure-commands=dev-master

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
echo -e "servingSizeUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "altServingSizeQuantity\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "altServingSizeUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "servingsPerContainer\nfloat\nno\n\n" | bin/console make:entity Nutrition
# - Calories
echo -e "calories\nfloat\nno\n\n" | bin/console make:entity Nutrition
echo -e "caloriesFromFat\nfloat\nno\n\n" | bin/console make:entity Nutrition
# - Fats
echo -e "totalFat\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "totalFatUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "saturatedFat\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "saturatedFatUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "transFat\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "transFatUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "cholesterol\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "cholesterolUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
# - Carbs
echo -e "totalCarbohydrates\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "totalCarbohydratesUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "dietaryFiber\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "dietaryFiberUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "totalSugars\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "totalSugarsUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "addedSugars\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "addedSugarsUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "otherCarbohydrates\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "otherCarbohydratesUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
# - Protein
echo -e "protein\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "proteinUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
# - Vitamins
echo -e "vitaminA\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "vitaminAUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "vitaminC\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "vitaminCUnit\ManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "vitaminD\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "vitaminDUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "vitaminE\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "vitaminEUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "vitaminK\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "vitaminKUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
# - Vitamin B variants
echo -e "thiamine\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "thiamineUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "riboflavin\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "riboflavinUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "niacin\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "niacinUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "pantothenicAcid\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "pantothenicAcidUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "pyridoxine\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "pyridoxineUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "biotin\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "biotinUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "folate\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "folateUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "cobalamin\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "cobalaminUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
# - Elements
echo -e "sodium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "sodiumUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "calcium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "calciumUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "iron\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "ironUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "phosphorus\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "phosphorusUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "potassium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "potassiumUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "magnesium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "magnesiumUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "copper\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "copperUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "manganese\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "manganeseUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "chromium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "chromiumUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition
echo -e "selenium\nfloat\nyes\n\n" | bin/console make:entity Nutrition
echo -e "seleniumUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity Nutrition

# Ingredient entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity Ingredient
echo -e "brand\nstring\n255\nyes\n\n" | bin/console make:entity Ingredient
echo -e "nutrition\nManyToOne\nNutrition\nyes\nno\n" | bin/console make:entity Ingredient

# IngredientSubstitution entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity IngredientSubstitution
echo -e "predecessor\nManyToOne\nIngredient\nyes\nno\n\n" | bin/console make:entity IngredientSubstitution
echo -e "predecessorQuantity\nfloat\nyes\n\n" | bin/console make:entity IngredientSubstitution
echo -e "predecessorUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity IngredientSubstitution
echo -e "replacement\nManyToOne\nIngredient\nyes\nno\n\n" | bin/console make:entity IngredientSubstitution
echo -e "replacementQuantity\nfloat\nyes\n\n" | bin/console make:entity IngredientSubstitution
echo -e "replacementUnit\nManyToOne\nUnit\nyes\nno\n\n" | bin/console make:entity IngredientSubstitution

# Recipe entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity Recipe
echo -e "ingredients\nManyToMany\nIngredient\nno\n\n" | bin/console make:entity Recipe
echo -e "possibleIngredientSubstitutions\nManyToMany\nIngredientSubstitution\nno\n\n" | bin/console make:entity Recipe
echo -e "steps\ntext\nno\n\n" | bin/console make:entity Recipe

# Meal entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity Meal
echo -e "brand\nstring\n255\nyes\n\n" | bin/console make:entity Meal
echo -e "ingredients\nManyToMany\nIngredient\nno\n" | bin/console make:entity Meal
echo -e "nutrition\nManyToOne\nNutrition\nyes\nno\n" | bin/console make:entity Meal

# MealPlan entity
echo -e "name\nstring\n255\nno\n\n" | bin/console make:entity MealPlan
echo -e "meals\nManyToMany\nMeal\nno\n\n" | bin/console make:entity MealPlan

# MealInstance entity
echo -e "meal\nManyToMany\nMeal\nno\n\n" | bin/console make:entity MealInstance

# FridgeTransaction entity
echo -e "ingredient\nManyToOne\nIngredient\nyes\nno\n\n" | bin/console make:entity FridgeTransaction
echo -e "quantity\nfloat\nyes\n\n" | bin/console make:entity FridgeTransaction
echo -e "createdAt\nManyToMany\nIngredient\nno\n\n" | bin/console make:entity FridgeTransaction

# GroceryTrip entity
echo -e "ingredients\nManyToMany\nIngredient\nno\n\n" | bin/console make:entity GroceryTrip

# Fridge entity
echo -e "ingredientInputs\nManyToMany\nFridgeTransaction\nno\n\n" | bin/console make:entity Fridge
sed -i 's/private Collection $ingredientInputs;/#[ORM\\JoinTable(name: "fridgeIngredientInputs")]\n    &/g' ./src/Entity/Fridge.php
echo -e "ingredientOutputs\nManyToMany\nFridgeTransaction\nno\n\n" | bin/console make:entity Fridge
sed -i 's/private Collection $ingredientOutputs;/#[ORM\\JoinTable(name: "fridgeIngredientOutputs")]\n    &/g' ./src/Entity/Fridge.php

# Validate entity definitions
bin/console d:s:v
bin/console d:s:u --force --complete
