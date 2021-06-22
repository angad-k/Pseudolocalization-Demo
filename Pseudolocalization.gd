extends Node2D

func _ready():
	$HBoxContainer/Pseudolocalization_options/accents.pressed = TranslationServer.is_pseudolocalization_accents_enabled()
	$HBoxContainer/Pseudolocalization_options/toggle.pressed = TranslationServer.is_pseudolocalization_accents_enabled()
	$HBoxContainer/Pseudolocalization_options/fakebidi.pressed = TranslationServer.is_pseudolocalization_fake_bidi_enabled()
	$HBoxContainer/Pseudolocalization_options/doublevowels.pressed = TranslationServer.is_pseudolocalization_double_vowels_enabled()
	$HBoxContainer/Pseudolocalization_options/prefix/TextEdit.text = TranslationServer.get_pseudolocalization_prefix()
	$HBoxContainer/Pseudolocalization_options/suffix/TextEdit.text = TranslationServer.get_pseudolocalization_suffix()
	pass 

func _on_accents_toggled(button_pressed):
	TranslationServer.set_pseudolocalization_accents_enabled(button_pressed)
	pass # Replace with function body.


func _on_toggle_toggled(button_pressed):
	TranslationServer.set_pseudolocalization_enabled(button_pressed)
	pass # Replace with function body.


func _on_fakebidi_toggled(button_pressed):
	TranslationServer.set_pseudolocalization_fake_bidi_enabled(button_pressed)
	pass # Replace with function body.


func _on_prefix_changed():
	TranslationServer.set_pseudolocalization_prefix($HBoxContainer/Pseudolocalization_options/prefix/TextEdit.text)
	pass # Replace with function body.


func _on_suffix_changed():
	TranslationServer.set_pseudolocalization_suffix($HBoxContainer/Pseudolocalization_options/suffix/TextEdit.text)
	pass # Replace with function body.


func _on_Pseudolocalize_pressed():
	$HBoxContainer/Pseudolocalizer/Result.text = TranslationServer.pseudolocalize($HBoxContainer/Pseudolocalizer/Key.text)
	pass # Replace with function body.


func _on_doublevowels_toggled(button_pressed):
	TranslationServer.set_pseudolocalization_double_vowels_enabled(button_pressed)
	pass # Replace with function body.
