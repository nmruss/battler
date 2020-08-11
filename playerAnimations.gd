extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var last_pressed: String = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	set_animation('default')
	play()
	pass # Replace with function body.

#last pressed tracking for turn
func _input(event):
	if(event.is_action_released("ui_right")): 
		last_pressed = "right"
	if(event.is_action_released("ui_left")):
		last_pressed = "left"
	pass
	
func _process(delta):
	if get_node("..").status == "charge":
		set_animation('charging')
	elif get_node("..").status == "attack":
		set_animation("attack")
	elif Input.is_action_pressed('ui_right'):
		flip_h = true
		set_animation('run')
	elif Input.is_action_pressed('ui_left'):
		flip_h = false
		set_animation('run')
	elif Input.is_action_pressed('ui_down'):
		set_animation('run')
	elif Input.is_action_pressed('ui_up'):
		set_animation('run')
	else:
		flip_h = true if last_pressed == "right" else false
		set_animation('default')
#	elif(!Input.is_action_pressed('ui_left') && !Input.is_action_pressed('ui_right')):
#		flip_h = true if last_pressed == "right" else false
#		set_animation('default')
	
	pass
