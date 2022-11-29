extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var cabbage = $"%Cabbage"
onready var growth_timer = $"%GrowthTimer"

var growth : int = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cabbage.play(str(growth))


func _on_GrowthTimer_timeout():
	# Growth animation
	growth += 1
