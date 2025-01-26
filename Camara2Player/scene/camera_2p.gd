extends Camera3D
@onready var sub_viewport_container: SubViewportContainer = $SubViewportContainer
@onready var sub_viewport_container_2: SubViewportContainer = $SubViewportContainer2

func _process(delta: float) -> void:

	sub_viewport_container.size.x=get_viewport().size.x/2;
	sub_viewport_container_2.size.x=get_viewport().size.x/2;
	
	sub_viewport_container.size.y=get_viewport().size.y;
	sub_viewport_container_2.size.y=get_viewport().size.y;
	
	sub_viewport_container_2.position.x=get_viewport().size.x/2;
	
