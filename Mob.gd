extends RigidBody2D

const HitEffect = preload("res://HitEffect.tscn")
const PlayerHurtSound = preload("res://PlayerHurtSound.tscn")
const VanquishEffect = preload("res://VanquishEffect.tscn")

signal vanquished

func _ready():
	$AnimatedSprite.playing = true
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Hitbox_area_entered(area):
	# print("take that!")
	pass

func _on_Hurtbox_area_entered(area):
	# print("I guess I'll just die then.")
	var effect = VanquishEffect.instance()
	get_tree().current_scene.add_child(effect)
	effect.global_position = global_position - Vector2(0, 8)
	# get_tree().current_scene.add_child(VanquishEffect.instance())
	emit_signal("vanquished")
	queue_free()
