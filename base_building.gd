class_name BaseBuilding extends BaseSelectable

@export var dropoff_types : Array[BaseResource.ResourceType]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	sprite = $Sprite2D

func _enter_tree() -> void:
	StateController.buildings.push_front(self)
	
func _exit_tree() -> void:
	StateController.buildings.erase(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
