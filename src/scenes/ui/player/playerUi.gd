extends CanvasLayer

@onready var healthBar = $Control/MarginContainer/Control/HealthBar
@onready var healthLabel = $Control/MarginContainer/Control/HealthLabel

var player: CharacterBody2D = null
var playerHealthComponent: HealthComponent
var currentHealth: int
var maxHealth: int

func _ready():
	player = NodeUtils.get_player()
	playerHealthComponent = player.get_node("HealthComponent")
	
	playerHealthComponent.connect("healthChanged", update_health_ui)
	#update()

func update_health_ui():
	
	maxHealth = playerHealthComponent.get_max_health()
	currentHealth = playerHealthComponent.get_health()
	
	healthBar.min_value = 0
	healthBar.max_value = maxHealth
	healthBar.value = currentHealth
	
	healthLabel.text = str(maxHealth) + "/" + str(currentHealth)
