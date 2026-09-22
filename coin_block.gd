extends StaticBody2D

var gave_coin = false
@onready var player_det: Area2D = $PlayerDet
const COIN = preload("uid://bci8r0scu3mxs")
@export var done_tex: Texture2D
@onready var sprite_2d: Sprite2D = $Sprite2D
func _ready() -> void:
	player_det.body_entered.connect(spawn_coin)
	
func spawn_coin(_body: Node2D):
	print(_body)
	if gave_coin:
		return
	gave_coin = true
	var coin = COIN.instantiate()
	coin.physics_enabled = true
	coin.velocity.y = -200.0
	coin.position = Vector2(0.0, -16.0)
	add_child.call_deferred(coin)
	sprite_2d.texture = done_tex
	
