extends Goes_Back

func _ready():
	start_movement()

func check_destination_first_last():
	match(current_move_direction):
		move_directions.FORWARD:
			if current_destination_index == last_destination_index:
				change_move_direction()
				return true
			else: 
				return false
		move_directions.BACKWARD:
			if current_destination_index == 0:
				change_move_direction()
				return true
			else: 
				return false
