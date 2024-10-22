class_name BaseResource extends StaticBody2D

enum ResourceType {FOOD, WOOD, GOLD, STONE}
@onready var sprite : Sprite2D = $Sprite2D
@export var resource_type : ResourceType = ResourceType.FOOD:
	set(new_value):
		if resource_type != new_value:
			resource_type = new_value
			apply_resource_sprite()

func apply_resource_sprite() -> void:
	if sprite != null:
		if resource_type == ResourceType.FOOD:
			sprite.texture = preload("res://sprites/medievalEnvironment_19.png")
		elif resource_type == ResourceType.WOOD:
			sprite.texture = preload("res://sprites/medievalEnvironment_03.png")
		elif resource_type == ResourceType.GOLD:
			sprite.texture = preload("res://sprites/medievalEnvironment_18.png")
		else:
			sprite.texture = preload("res://sprites/medievalEnvironment_17.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_resource_sprite()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
