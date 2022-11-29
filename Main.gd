extends Node2D

const BOIDS_COUNT = 200


const REPELLENT = preload("res://Repellent.tscn")
onready var boid_scene = preload("res://Boid.tscn")
onready var boids_container = $YSort/Boids
onready var dog = $YSort/Dog

#onready var water = $Water
onready var color_rect = $CanvasLayer/ColorRect
onready var animation_player = $CanvasLayer/AnimationPlayer

var boids = []

func _process(delta):
	if Input.is_action_just_pressed("bark"):
		
		shockwave(dog.position)
#		spawn_repellent($Dog.position)		

func shockwave(new_position):
#	color_rect.material.shader_param/center = new_position/Vector2(1024, 680)
	$CanvasLayer/AnimationPlayer.play("shockwave")
	
	
#func spawn_repellent(new_position):
#	# Basically just an obstacle
#	print('BARK!')
#	var repellent = REPELLENT.instance()
#	repellent.position = new_position
#	add_child(repellent)

func _ready():
	for i in BOIDS_COUNT:
		var boid = boid_scene.instance()
		boid.move_speed = $HUD/VBoxContainer/MoveSlider/HSlider.value
		boid.steer_force = $HUD/VBoxContainer/TurnSlider/HSlider.value
		boid.alignment_force = $HUD/VBoxContainer/AlignSlider/HSlider.value
		boid.cohesion_force = $HUD/VBoxContainer/CohesionSlider/HSlider.value
		boid.seperation_force = $HUD/VBoxContainer/AlignSlider/HSlider.value
		boids_container.add_child(boid)
		boids.push_back(boid)
		
	
	for boid in boids_container.get_children():
		boid.boids = boids
		
	# Add a predator boid
	for boid in boids_container.get_children():
		boid.predator_boids = [dog]
	

func _on_MoveSlider_value_changed(value):
	for boid in boids:
		boid.move_speed = value


func _on_TurnSlider_value_changed(value):
	for boid in boids:
		boid.steer_force = value


func _on_AlignSlider_value_changed(value):
	for boid in boids:
		boid.alignment_force = value


func _on_CohesionSlider_value_changed(value):
	for boid in boids:
		boid.cohesion_force = value


func _on_SeperationSlider_value_changed(value):
	for boid in boids:
		boid.seperation_force = value



