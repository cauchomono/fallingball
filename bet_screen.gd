extends Node2D




func _on_h_slider_value_changed(value: float) -> void:
	%PointsBet.text = str(int(value))
	print(value) # Replace with function body.
