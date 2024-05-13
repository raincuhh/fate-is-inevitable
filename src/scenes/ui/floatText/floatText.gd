extends Marker2D

@onready var floatText = $"."
@onready var label = $Label

var amount: int = 0
var rng = RandomNumberGenerator.new()
var pos: Vector2
var type = ""
var size: Vector2 = Vector2(2.0, 2.0)
var spawnPosition: Vector2

#TODO - critical hit type

func _ready():
	var tween = get_tree().create_tween()
	
	label.z_index = 30
	label.text = str(amount)
	
	#match type:
	#	"heal":
	#		label.set("theme_override_colors/font_color", Color("239063"))
	#	"damage":
	#		#size = Vector2(2.5, 2.5)
	#		label.set("theme_override_colors/font_color", Color("ae2334"))
	#		
	
	var xRng = rng.randf_range(-20.0, 20.0)
	var yRng = rng.randf_range(-10.0, 10.0)
	
	randomize()
	tween.tween_property(self, "scale", Vector2(size), 0.35).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", Vector2(spawnPosition.x + xRng, spawnPosition.y + -20.0 + yRng), 0.35).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(self, "scale", Vector2(), 0.5)
	
	tween.finished.connect(on_finish)

func on_finish():
	floatText.queue_free()
