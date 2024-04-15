extends State

@export var return_state : State 
@export var return_animation_node : String = "Move"
@export var transform_name : String = "transform"

@onready var timer : Timer = $Timer



func _on_animation_tree_animation_started(anim_name):
	if(anim_name == transform_name):
		timer.start()
	


func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == transform_name):
		if(timer.is_stopped()):
			next_state = return_state
			playback.travel(return_animation_node)
