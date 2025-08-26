extends Node2D

@export var shop_card_2: PackedScene
@export var shop_card_3: PackedScene
@export var shop_card_4: PackedScene
@export var shop_card_5: PackedScene
@export var shop_card_6: PackedScene
@export var shop_card_7: PackedScene
@export var shop_card_8: PackedScene
@export var shop_card_9: PackedScene
@export var shop_card_10: PackedScene



@onready var items = \
[
	{
		'prefab': shop_card_2,
		'price': 10
	},
	{
		'prefab': shop_card_3,
		'price': 10
	},
	{
		'prefab': shop_card_4,
		'price': 10
	},
	{
		'prefab': shop_card_5,
		'price': 10
	},
	{
		'prefab': shop_card_6,
		'price': 10
	},
	{
		'prefab': shop_card_7,
		'price': 10
	},
	{
		'prefab': shop_card_8,
		'price': 10
	},
	{
		'prefab': shop_card_9,
		'price': 10
	},
	{
		'prefab': shop_card_10,
		'price': 10
	}
]

