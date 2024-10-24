extends BaseUnit

var carrying : BaseResource.ResourceType = BaseResource.ResourceType.NONE

func _on_interact_area_body_entered(body: Node2D) -> void:
	super(body)
	if body is BaseResource:
		var resource : BaseResource = body as BaseResource
		if carrying == BaseResource.ResourceType.NONE:
			carrying = resource.resource_type
			print("Picked up %s" % [resource.resource_type])
	elif body is BaseBuilding:
		var building : BaseBuilding = body as BaseBuilding
		if carrying != BaseResource.ResourceType.NONE:
			print("Dropped off %s" % [carrying])
			carrying = BaseResource.ResourceType.NONE
