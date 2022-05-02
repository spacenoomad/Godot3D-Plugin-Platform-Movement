extends Platforms

class_name Goes_Back

enum move_directions {
	FORWARD,
	BACKWARD
}

var current_move_direction = move_directions.FORWARD

func increment_movement():
	match(current_move_direction):
		move_directions.FORWARD:
			if check_if_destination_reached():
				increment_destination()
		move_directions.BACKWARD:
			if check_if_destination_reached():
				decrease_destination()


func check_destination_first_last():
	match(current_move_direction):
		move_directions.FORWARD:
			if current_destination_index == last_destination_index:
				stop_movement()
				change_move_direction()
				return true
			else: 
				return false
		move_directions.BACKWARD:
			if current_destination_index == 0:
				stop_movement()
				change_move_direction()
				return true
			else: 
				return false

func decrease_destination():
	current_destination_index -= 1
	target_position = route.get_child(current_destination_index).global_transform.origin

func change_move_direction():
	match(current_move_direction):
		move_directions.FORWARD:
			current_move_direction = move_directions.BACKWARD
			decrease_destination()
		move_directions.BACKWARD:
			current_move_direction = move_directions.FORWARD
			increment_movement()
			

#func start_movement():
#	change_state(movement_states.MOVING)
#
#func stop_movement():
#	change_state(movement_states.IDLE)
