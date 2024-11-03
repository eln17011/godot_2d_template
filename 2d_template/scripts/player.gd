extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite

@export var speed: float = 200.0  # Movement speed of the character

const GRAVITY = 200.0

var controller_id

var move_up
var move_down
var move_left
var move_right
var controller_ready := false

@export var cur_dir: Vector2 = Vector2.LEFT

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	# Get input direction
	if controller_ready == true:
		direction = Input.get_vector(move_left, move_right, move_up, move_down).normalized()
	# Update last known facing, used for hook
	if direction != Vector2.ZERO:
		cur_dir = direction

	#velocity.x = direction * speed
	velocity.y += delta * GRAVITY

	# Move the character
	move_and_slide()

func _ready() -> void:
	pass

func set_controller_id(id) -> void:
	controller_id = id
	move_up = "move_up" + str(controller_id)
	move_down = "move_down" + str(controller_id)
	move_right = "move_right" + str(controller_id)
	move_left = "move_left" + str(controller_id)
	controller_ready = true

func _process(_delta) -> void:
	pass
