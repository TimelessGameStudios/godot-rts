class_name Villager extends BaseUnit

var carrying : BaseResource.ResourceType = BaseResource.ResourceType.NONE
var job_site : BaseResource = null

func _ready() -> void:
	super()
	SignalBus.resource_clicked.connect(_on_resource_clicked)

func _on_interact_area_body_entered(body: Node2D) -> void:
	super(body)
	if job_site == null:
		return
	if body is BaseResource:
		var resource : BaseResource = body as BaseResource
		if resource.resource_type == job_site.resource_type:
			if carrying == BaseResource.ResourceType.NONE:
				carrying = resource.resource_type
				print("Picked up %s" % [resource.resource_type])
				var dropoff = StateController.get_nearest_dropoff(global_position, carrying)
				if dropoff != null:
					target = dropoff.global_position
	elif body is BaseBuilding:
		var building : BaseBuilding = body as BaseBuilding
		if carrying != BaseResource.ResourceType.NONE:
			print("Dropped off %s" % [carrying])
			carrying = BaseResource.ResourceType.NONE
			target = job_site.global_position

func _on_resource_clicked(object, resource_type) -> void:
	if selected:
		job_site = object
		print("%s resource clicked for %s" % [object.name, name])
