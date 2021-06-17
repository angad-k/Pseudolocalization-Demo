extends Node2D

func _ready():
	$Pseudolocalization_options/accents.pressed = TranslationServer.get_pseudolocalization_accents_enabled()
	$Pseudolocalization_options/toggle.pressed = TranslationServer.get_pseudolocalization_accents_enabled()
	$Pseudolocalization_options/fakebidi.pressed = TranslationServer.get_pseudolocalization_fake_bidi()
	$Pseudolocalization_options/prefix/TextEdit.text = TranslationServer.get_pseudolocalization_prefix()
	$Pseudolocalization_options/suffix/TextEdit.text = TranslationServer.get_pseudolocalization_suffix()
	pass 

func _on_accents_toggled(button_pressed):
	TranslationServer.set_pseudolocalization_accents_enabled(button_pressed)
	pass # Replace with function body.


func _on_toggle_toggled(button_pressed):
	TranslationServer.set_pseudolocalization_enabled(button_pressed)
	pass # Replace with function body.


func _on_fakebidi_toggled(button_pressed):
	TranslationServer.set_pseudolocalization_fake_bidi(button_pressed)
	pass # Replace with function body.


func _on_prefix_changed():
	TranslationServer.set_pseudolocalization_prefix($Pseudolocalization_options/prefix/TextEdit.text)
	pass # Replace with function body.


func _on_suffix_changed():
	TranslationServer.set_pseudolocalization_suffix($Pseudolocalization_options/suffix/TextEdit.text)
	pass # Replace with function body.


func _on_Pseudolocalize_pressed():
	$Pseudolocalizer/Result.text = TranslationServer.pseudolocalize($Pseudolocalizer/Key.text)
	pass # Replace with function body.
