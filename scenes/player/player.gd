extends CharacterBody2D

var can_laser: bool = true
var can_granade: bool = true

signal laser
signal granade

func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	
	if Input.is_action_pressed("primary action") and can_laser:
		print('shoot laser')
		can_laser = false
		$LaserReloadTimer.start()
		laser.emit()
		
	if Input.is_action_pressed("secondary action") and can_granade:
		print('shoot granade')
		can_granade = false
		$GranadeReloadTimer.start()
		granade.emit()


func _on_timer_timeout():
	can_laser = true


func _on_timer_2_timeout():
	can_granade = true
