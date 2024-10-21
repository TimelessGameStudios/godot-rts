class_name BaseSelectable extends CharacterBody2D

@export var sprite : Sprite2D
@export var selected : bool:
	set(new_value):
		if new_value != selected:
			selected = new_value
			if sprite != null:
				if selected:
					sprite.material = preload("res://2dhighlightmaterial.tres")
				else:
					sprite.material = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_event.connect(_on_input_event)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var mouseEvent : InputEventMouseButton = event as InputEventMouseButton
		if mouseEvent.button_index == MOUSE_BUTTON_LEFT:
			if mouseEvent.is_pressed():
				if not mouseEvent.ctrl_pressed and not mouseEvent.shift_pressed:
					selected = false
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		var mouseEvent : InputEventMouseButton = event as InputEventMouseButton
		if mouseEvent.button_index == MOUSE_BUTTON_LEFT:
			if mouseEvent.is_pressed():
				if mouseEvent.shift_pressed:
					selected = true
				else:
					selected = not selected
