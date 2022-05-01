extends Goes_Back

class_name Button_Pressing_Back

func button_down():
	start_movement()

func button_up():
	stop_movement()

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
