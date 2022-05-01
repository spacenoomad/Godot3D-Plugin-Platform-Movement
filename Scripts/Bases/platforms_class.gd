extends KinematicBody

class_name Platforms

onready var route = get_parent().get_child(0)
onready var platform = self

var target_position = Vector3()

var last_destination_index = 0
var current_destination_index = 0


export var speed = 0.03

enum movement_states {
	IDLE,
	MOVING
}

var platform_movement_state = movement_states.IDLE

func _ready():
	config()

func config():
	platform.transform.origin = route.get_child(0).get_translation()
	last_destination_index = route.get_child_count() - 1
	increment_destination()

func _physics_process(delta):
	platform_movement()

func platform_movement():
	match(platform_movement_state):
		movement_states.IDLE:
			pass
		movement_states.MOVING:
			move_to_target()
			increment_movement()

func change_state(target_state):
	platform_movement_state = target_state

func move_to_target():
	platform.transform.origin = platform.transform.origin.move_toward(target_position, speed)
	platform.move_and_slide(Vector3.ZERO)


func increment_movement():
	if check_if_destination_reached():
		increment_destination()

func increment_destination():
	current_destination_index += 1
	target_position = route.get_child(current_destination_index).get_translation()

func check_destination_first_last():
	if current_destination_index == last_destination_index:
		stop_movement()
		return true
	else: 
		return false

func check_if_destination_reached():
	if platform.transform.origin.distance_to(route.get_child(current_destination_index).transform.origin) < 0.1:
		if check_destination_first_last():
			return false
		return true
	else: return false

func start_movement():
	change_state(movement_states.MOVING)

func stop_movement():
	change_state(movement_states.IDLE)
