extends BaseSelectable

@export var speed : float = 32.0
@onready var target : Vector2 = Vector2(position)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	sprite = $Sprite2D
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	var distance = global_transform.origin.distance_to(target)
	var direction = global_transform.origin.direction_to(target)
	var max_speed = distance / delta
	if distance > 5:
		velocity = direction * minf(speed, max_speed)
		move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	super(event)
	if event is InputEventMouseButton:
		var mouseEvent : InputEventMouseButton = event as InputEventMouseButton
		if mouseEvent.button_index == MOUSE_BUTTON_RIGHT:
			if selected:
				target = event.global_position
