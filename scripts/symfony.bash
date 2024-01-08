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

# Add conjure commands repo
composer config repositories.ramity/conjure-commands path /root/conjure-commands
composer require --dev ramity/conjure-commands:dev-main@dev

# Replace remote with local maker-bundle repo
composer config repositories.symfony/maker-bundle path /root/maker-bundle
composer require --dev symfony/maker-bundle:dev-main@dev

# Update deps
composer update

# Drop database if exists and create fresh
bin/console d:d:d --if-exists --force
bin/console d:d:c

# User entity
bin/console conjure:wrapper make:user User yes uuid yes

# Unit entity
bin/console conjure:wrapper make:entity Unit no name string 255 no ""
bin/console conjure:wrapper make:entity Unit abbreviation string 255 no ""

# Nutrition entity
bin/console conjure:wrapper make:entity Nutrition no ""
bin/console conjure:wrapper make:entity Nutrition servingSizeQuantity float no ""
bin/console conjure:wrapper make:entity Nutrition servingSizeUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition altServingSizeQuantity float yes ""
bin/console conjure:wrapper make:entity Nutrition altServingSizeUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition servingsPerContainer float no ""
# - Calories
bin/console conjure:wrapper make:entity Nutrition calories float no ""
bin/console conjure:wrapper make:entity Nutrition caloriesFromFat float no ""
# - Fats
bin/console conjure:wrapper make:entity Nutrition totalFat float yes ""
bin/console conjure:wrapper make:entity Nutrition totalFatUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition saturatedFat float yes ""
bin/console conjure:wrapper make:entity Nutrition saturatedFatUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition transFat float yes ""
bin/console conjure:wrapper make:entity Nutrition transFatUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition cholesterol float yes ""
bin/console conjure:wrapper make:entity Nutrition cholesterolUnit ManyToOne Unit yes no ""
# - Carbs
bin/console conjure:wrapper make:entity Nutrition totalCarbohydrates float yes ""
bin/console conjure:wrapper make:entity Nutrition totalCarbohydratesUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition dietaryFiber float yes ""
bin/console conjure:wrapper make:entity Nutrition dietaryFiberUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition totalSugars float yes ""
bin/console conjure:wrapper make:entity Nutrition totalSugarsUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition addedSugars float yes ""
bin/console conjure:wrapper make:entity Nutrition addedSugarsUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition otherCarbohydrates float yes ""
bin/console conjure:wrapper make:entity Nutrition otherCarbohydratesUnit ManyToOne Unit yes no ""
# - Protein
bin/console conjure:wrapper make:entity Nutrition protein float yes ""
bin/console conjure:wrapper make:entity Nutrition proteinUnit ManyToOne Unit yes no ""
# - Vitamins
bin/console conjure:wrapper make:entity Nutrition vitaminA float yes ""
bin/console conjure:wrapper make:entity Nutrition vitaminAUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition vitaminC float yes ""
bin/console conjure:wrapper make:entity Nutrition vitaminCUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition vitaminD float yes ""
bin/console conjure:wrapper make:entity Nutrition vitaminDUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition vitaminE float yes ""
bin/console conjure:wrapper make:entity Nutrition vitaminEUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition vitaminK float yes ""
bin/console conjure:wrapper make:entity Nutrition vitaminKUnit ManyToOne Unit yes no ""
# - Vitamin B variants
bin/console conjure:wrapper make:entity Nutrition thiamine float yes ""
bin/console conjure:wrapper make:entity Nutrition thiamineUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition riboflavin float yes ""
bin/console conjure:wrapper make:entity Nutrition riboflavinUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition niacin float yes ""
bin/console conjure:wrapper make:entity Nutrition niacinUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition pantothenicAcid float yes ""
bin/console conjure:wrapper make:entity Nutrition pantothenicAcidUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition pyridoxine float yes ""
bin/console conjure:wrapper make:entity Nutrition pyridoxineUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition biotin float yes ""
bin/console conjure:wrapper make:entity Nutrition biotinUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition folate float yes ""
bin/console conjure:wrapper make:entity Nutrition folateUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition cobalamin float yes ""
bin/console conjure:wrapper make:entity Nutrition cobalaminUnit ManyToOne Unit yes no ""
# - Elements
bin/console conjure:wrapper make:entity Nutrition sodium float yes ""
bin/console conjure:wrapper make:entity Nutrition sodiumUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition calcium float yes ""
bin/console conjure:wrapper make:entity Nutrition calciumUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition iron float yes ""
bin/console conjure:wrapper make:entity Nutrition ironUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition phosphorus float yes ""
bin/console conjure:wrapper make:entity Nutrition phosphorusUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition potassium float yes ""
bin/console conjure:wrapper make:entity Nutrition potassiumUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition magnesium float yes ""
bin/console conjure:wrapper make:entity Nutrition magnesiumUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition copper float yes ""
bin/console conjure:wrapper make:entity Nutrition copperUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition manganese float yes ""
bin/console conjure:wrapper make:entity Nutrition manganeseUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition chromium float yes ""
bin/console conjure:wrapper make:entity Nutrition chromiumUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity Nutrition selenium float yes ""
bin/console conjure:wrapper make:entity Nutrition seleniumUnit ManyToOne Unit yes no ""

# Ingredient entity
bin/console conjure:wrapper make:entity Ingredient no ""
bin/console conjure:wrapper make:entity Ingredient name string 255 no ""
bin/console conjure:wrapper make:entity Ingredient brand string 255 yes ""
bin/console conjure:wrapper make:entity Ingredient Nutrition ManyToOne Nutrition yes no ""

# IngredientSubstitution entity
bin/console conjure:wrapper make:entity IngredientSubstitution no ""
bin/console conjure:wrapper make:entity IngredientSubstitution name string 255 no ""
bin/console conjure:wrapper make:entity IngredientSubstitution predecessor ManyToOne Ingredient yes no ""
bin/console conjure:wrapper make:entity IngredientSubstitution predecessorQuantity float yes ""
bin/console conjure:wrapper make:entity IngredientSubstitution predecessorUnit ManyToOne Unit yes no ""
bin/console conjure:wrapper make:entity IngredientSubstitution replacement ManyToOne Ingredient yes no ""
bin/console conjure:wrapper make:entity IngredientSubstitution replacementQuantity float yes ""
bin/console conjure:wrapper make:entity IngredientSubstitution replacementUnit ManyToOne Unit yes no ""

# Recipe entity
bin/console conjure:wrapper make:entity Recipe no ""
bin/console conjure:wrapper make:entity Recipe name string 255 no ""
bin/console conjure:wrapper make:entity Recipe ingredients ManyToMany Ingredient no no ""
bin/console conjure:wrapper make:entity Recipe possibleIngredientSubstitutions ManyToMany IngredientSubstitution no no ""
bin/console conjure:wrapper make:entity Recipe steps text no ""

# Meal entity
bin/console conjure:wrapper make:entity Meal no ""
bin/console conjure:wrapper make:entity Meal name string 255 no ""
bin/console conjure:wrapper make:entity Meal brand string 255 yes ""
bin/console conjure:wrapper make:entity Meal ingredients ManyToMany Ingredient no no ""
bin/console conjure:wrapper make:entity Meal Nutrition ManyToOne Nutrition yes no ""

# MealPlan entity
bin/console conjure:wrapper make:entity MealPlan no ""
bin/console conjure:wrapper make:entity MealPlan name string 255 no ""
bin/console conjure:wrapper make:entity MealPlan meals ManyToMany Meal no no ""

# MealInstance entity
bin/console conjure:wrapper make:entity MealInstance no ""
bin/console conjure:wrapper make:entity MealInstance meal ManyToMany Meal no no ""

# FridgeTransaction entity
bin/console conjure:wrapper make:entity FridgeTransaction no ""
bin/console conjure:wrapper make:entity FridgeTransaction ingredient ManyToOne Ingredient yes no ""
bin/console conjure:wrapper make:entity FridgeTransaction quantity float yes ""
bin/console conjure:wrapper make:entity FridgeTransaction createdAt ManyToMany Ingredient no no ""

# GroceryTrip entity
bin/console conjure:wrapper make:entity GroceryTrip no ""
bin/console conjure:wrapper make:entity GroceryTrip ingredients ManyToMany Ingredient no no ""

# Fridge entity
bin/console conjure:wrapper make:entity Fridge no ""
bin/console conjure:wrapper make:entity Fridge ingredientInputs ManyToMany FridgeTransaction no yes fridgeIngredientInputs ""
bin/console conjure:wrapper make:entity Fridge ingredientOutputs ManyToMany FridgeTransaction no yes fridgeIngredientOutputs ""

# Validate entity definitions
bin/console d:s:v
bin/console d:s:u --force --complete
