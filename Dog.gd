extends AnimatedSprite


#const SPEED = 60
const RUNNING_SPEED = 300

var direction = Vector2.ZERO
var speed


func _process(delta):
	get_direction()
	move(delta)
	animate()

func get_direction():
	direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
func move(delta):
#	if Input.is_action_pressed("sprint"):
	speed = RUNNING_SPEED
#	else:
#		speed = SPEED
	position += direction.normalized() * speed * delta
	
func animate():
	if direction.length() == 0:
		play("idle")
	else:
#		if speed == SPEED:
#			play("walking")
#		else:
		play("running")
		
	if direction.x > 0:
		flip_h = true
	elif direction.x < 0:
		flip_h = false
	
	
