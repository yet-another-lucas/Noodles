extends Node2D


const BuffEffect = preload("res://BuffEffect.tscn")
signal buff

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Hurtbox_area_entered(area):
	print("yum")
	var effect = BuffEffect.instance()
	get_tree().current_scene.add_child(effect)
	# effect.play(0.0)
	print("did it play?")
	# effect.queue_free()
	# emit_signal("buff")
	queue_free()



func _on_BuffEffect_finished():
	print("I am jack's buff")
	pass
