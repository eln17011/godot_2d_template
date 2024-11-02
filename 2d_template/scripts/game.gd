extends Node2D

# Load the Player scene
var PlayerScene: PackedScene = preload("res://scenes/player.tscn")

@onready var grunk_timer: Timer = $GrunkTimer
@onready var hud: HUD = $HUD
@onready var stone_timer : Timer = $StoneTimer

const spawn_point = Vector2(1000, 500)

func _ready():
	
	var connected = Input.get_connected_joypads()
	var i = 0
	for joy in connected:
		create_player(i)
		i += 1
	if connected.size() == 0:
		create_player(0)


func create_player(i: int) -> void:
	var player = PlayerScene.instantiate()
	player.set_controller_id(i)
