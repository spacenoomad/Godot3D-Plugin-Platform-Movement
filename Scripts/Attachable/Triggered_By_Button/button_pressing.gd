extends Platforms

class_name Button_Pressing

func button_down():
	start_movement()

func button_up():
	stop_movement()

func check_destination_first_last():
	if current_destination_index == last_destination_index:
		return true
	else: 
		return false
