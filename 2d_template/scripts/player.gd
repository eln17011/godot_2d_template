extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D

@export var speed: float = 200.0  # Movement speed of the character

var controller_id

var move_up
var move_down
var move_left
var move_right
var controller_ready := false

@export var cur_dir: Vector2 = Vector2.LEFT

func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	# Get input direction
	if controller_ready == true:
		direction = Input.get_vector(move_left, move_right, move_up, move_down).normalized()
	# Update last known facing, used for hook
	if direction != Vector2.ZERO:
		cur_dir = direction
		rotation = (cur_dir.angle() + PI/2) - get_parent().rotation

	velocity = direction * speed

	# Move the character
	move_and_slide()

func _ready() -> void:
	if(controller_id % 2 == 1):
		var texture = load("res://Assets/Cap2.png")
		sprite.texture = texture

func set_controller_id(id) -> void:
	controller_id = id
	move_up = "move_up" + str(controller_id)
	move_down = "move_down" + str(controller_id)
	move_right = "move_right" + str(controller_id)
	move_left = "move_left" + str(controller_id)
	controller_ready = true

func _process(_delta) -> void:
	pass
