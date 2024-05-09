extends Marker2D

@onready var floatText = $"."
@onready var label = $Label
@onready var tween = get_tree().create_tween()
var amount : int = 0
var rng = RandomNumberGenerator.new()
var pos: Vector2 = Vector2(0,0)
var type = ""
var size: Vector2 = Vector2(2.0, 2.0)

func _ready():
	label.z_index = 30
	label.text = str(amount)
	
	match type:
		"heal":
			label.set("theme_override_colors/font_color", Color("239063"))
		"damage":
			#size = Vector2(2.5, 2.5) #TODO this but for crits
			label.set("theme_override_colors/font_color", Color("ae2334"))
			
	
	var xMovement = rng.randf_range(-10.0, 10.0)
	pos = Vector2(xMovement, -20.0)
	tween.tween_property(self, "scale", Vector2(size), 0.35)
	tween.tween_property(self, "position", Vector2(pos), 0.4)
	tween.parallel().tween_property(self, "scale", Vector2(), 0.5)
	tween.finished.connect(on_finish)

func on_finish():
	floatText.queue_free()
