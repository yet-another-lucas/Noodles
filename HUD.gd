extends CanvasLayer

signal start_game
var title = "Noodle\nTime"

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = title
	$MessageLabel.show()
	yield(get_tree().create_timer(1), "timeout")
	$StartButton.show()


func update_score(score):
	$ScoreLabel.text = str(score)

func update_health(health):
	$HealthLabel.text = str(health)
	
func update_kills(kills):
	$MurderLabel.text = str(kills)

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$MessageLabel.hide()
