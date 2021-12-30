extends Area2D

export var HIT_WARD_SECONDS = 2.5


signal hit
signal ouch

onready var hurtbox = $Hurtbox
onready var hurtbox_collider = $Hurtbox/CollisionShape2D
onready var exhaust = $Exhaust

# onready var blinkPlayer = $BlinkPlayer
const PlayerHurtSound = preload("res://PlayerHurtSound.tscn")

var screen_size # Size of the game window.
var last_position
var health = 3
var dead = false

func _ready():
	screen_size = get_viewport_rect().size
	hide()
	exhaust.hide()
	exhaust.clear_points()

func _process(delta):
	last_position = position
	position = get_global_mouse_position()
	var velocity = position - last_position
	if last_position != position:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_v = velocity.y > 0

func start(pos):
	position = pos
	health = 3
	dead = false
	show()
	hurtbox_collider.disabled = false
	exhaust.clear_points()
	exhaust.show()


func _on_Player_body_entered(_body):
	pass #legacy collider from demo

func _on_Hurtbox_ward_started():
	pass # Replace with blinkplayer
	# blinkPlayer.play("Start")

func _on_Hurtbox_ward_ended():
	pass # Replace with blinkplayer
	# blinkPlayer.play("Stop")

func _on_Hurtbox_area_entered(area):
	if hurtbox.ward == false:
		# stats.health -= area.damage
		# hurtbox.start_ward(HIT_WARD_SECONDS)
		# hurtbox.create_hit_effect(self)
		# get_tree().current_scene.add_child(PlayerHurtSound.instance())
		health -=1
		emit_signal("ouch")
		# print("ouch: ", health)
		if health < 1:
			if not dead:
				# print("time to die")
				dead = true
				hide()
				exhaust.hide()
				exhaust.clear_points()
				hurtbox_collider.set_deferred("disabled", true)
				emit_signal("hit")
		else:
			hurtbox.start_ward(HIT_WARD_SECONDS)
			hurtbox.create_hit_effect(self)
			get_tree().current_scene.add_child(PlayerHurtSound.instance())


func _on_Hitbox_area_entered(area):
	pass
	# print("I lash at thee")
