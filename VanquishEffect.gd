extends AnimatedSprite

func _ready():
	var _connect = connect("animation_finished", self, "_on_animation_finished")
	print("vanquish")
	play("Animate")

func _on_animation_finished():
	queue_free()
