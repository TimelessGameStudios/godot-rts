extends Node

var units : Array[BaseUnit]
var buildings : Array[BaseBuilding]

func get_nearest_dropoff(_pos : Vector2, _type : BaseResource.ResourceType) -> BaseBuilding:
	var lowest_distance = INF
	var closest_dropoff : BaseBuilding
	for building in buildings:
		var distance = building.global_position.distance_squared_to(_pos)
		if distance < lowest_distance:
			closest_dropoff = building
			lowest_distance = distance
	
	if !is_instance_valid(closest_dropoff) or lowest_distance == INF:
		return null
	else:
		return closest_dropoff

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
