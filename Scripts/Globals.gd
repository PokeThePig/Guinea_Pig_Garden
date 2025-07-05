extends Node

#Guinea pigs
var guinea_dictionary = {}
var guinea_purchase_order = []

var new_pig = null
var upgrade_guinea_id = null
var poop_speed_upgrade_amount = 0.0
var double_poop_upgrade_amount = 0
var giant_poop_upgrade_minimum = 0
var giant_poop_upgrade_maximum = 0

var upgrade_dictionary = {"Bella": []}

#Unique upgrades
var squeek_frenzy_purchased = false
var squeek_frenzy_effect_active = false
var squeek_frenzy_duration = 0

var hibernation_purchased = false
var hiberation_sleep_active = false
var hiberation_effect_active = false
var hibernation_sleep_time = 0
var hibernation_effect_time = 0

var rain_or_shine_purchased = false
var giant_prismatic_purchased = false
var chroma_prismatic_odds = 1

var copper_poop_purchased = false
var copper_poop_value = 1

var kings_coronation_purchased = false
var king_poop_dropped = false
var kings_coronation_active = false

#Poop counts
var poop_amount = 0
var diamond_poop_amount = 0
var prismatic_poop_amount = 0

var currently_raining = false
var past_scene = null
var game_loaded = false

#Shop purchases
var guinea_two_purchased = false
var rich_guinea_purchased = false
var rainbow_guinea_purchased = false
var king_calix_purchased = false

var guinea_pigs_purchased = 0
var pet_count = 0

#Achievements
var gold_rush_achievement_completed = false
var diamond_digger_achievement_completed = false
var taste_rainbow_achievement_completed = false
var colossal_crusher_achievement_completed = false
var poop_frenzy_achievement_completed = false
var full_house_achievement_completed = false
var disco_party_achievement_completed = false
var manure_millionare_achievement_completed = false
var petting_professional_achievement_completed = false

#Poop type purchases
var diamond_poop_purchased = false
var giant_poop_purchased = false
var prismatic_poop_purchased = false

var double_poop_purchased = false

#Poop drops variables
var state = 0
var movespeed = 0
var poop_drop_speed = 0
var golden_poop_active = false
var gold_poop_pig = null
var golden_poop_dropped = false
var poop_speed_multiplier = 1
var max_speed_upgrade = false
var giant_poop_min = 1
var giant_poop_max = 1.5

#settings
var master_volume = 0.75
var music_volume = 0.75
var sound_effects_volume = 0.75
var auto_save = true
