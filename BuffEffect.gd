extends AudioStreamPlayer

func _ready():
	var _connect = connect("finished", self, "_on_buff_finished")
	
func _on_buff_finished():
	queue_free()
