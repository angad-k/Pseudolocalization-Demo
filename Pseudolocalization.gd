extends Node2D

func _ready():
	$HBoxContainer/Pseudolocalization_options/accents.pressed = ProjectSettings.get("internationalization/pseudolocalization/replace_with_accents")
	$HBoxContainer/Pseudolocalization_options/toggle.pressed = TranslationServer.is_pseudolocalization_enabled()
	$HBoxContainer/Pseudolocalization_options/fakebidi.pressed = ProjectSettings.get("internationalization/pseudolocalization/fake_bidi")
	$HBoxContainer/Pseudolocalization_options/doublevowels.pressed = ProjectSettings.get("internationalization/pseudolocalization/double_vowels")
	$HBoxContainer/Pseudolocalization_options/override.pressed = ProjectSettings.get("internationalization/pseudolocalization/override")
	$HBoxContainer/Pseudolocalization_options/skipplaceholders.pressed = ProjectSettings.get("internationalization/pseudolocalization/skip_placeholders")
	$HBoxContainer/Pseudolocalization_options/prefix/TextEdit.text = ProjectSettings.get("internationalization/pseudolocalization/prefix")
	$HBoxContainer/Pseudolocalization_options/suffix/TextEdit.text = ProjectSettings.get("internationalization/pseudolocalization/suffix")
	$HBoxContainer/Pseudolocalization_options/exp_ratio/TextEdit.text = str(ProjectSettings.get("internationalization/pseudolocalization/expansion_ratio"))
	pass 

func _on_accents_toggled(button_pressed):
	ProjectSettings.set("internationalization/pseudolocalization/replace_with_accents", button_pressed)
	TranslationServer.reload_pseudolocalization()
	pass


func _on_toggle_toggled(button_pressed):
	TranslationServer.set_pseudolocalization_enabled(button_pressed)
	#Since pseudolocalization can be enabled directly through this method, you don't need to reload.
	pass


func _on_fakebidi_toggled(button_pressed):
	ProjectSettings.set("internationalization/pseudolocalization/fake_bidi", button_pressed)
	TranslationServer.reload_pseudolocalization()
	pass


func _on_prefix_changed():
	ProjectSettings.set("internationalization/pseudolocalization/prefix", $HBoxContainer/Pseudolocalization_options/prefix/TextEdit.text)
	TranslationServer.reload_pseudolocalization()
	pass


func _on_suffix_changed():
	ProjectSettings.set("internationalization/pseudolocalization/suffix", $HBoxContainer/Pseudolocalization_options/suffix/TextEdit.text)
	TranslationServer.reload_pseudolocalization()
	pass


func _on_Pseudolocalize_pressed():
	$HBoxContainer/Pseudolocalizer/Result.text = TranslationServer.pseudolocalize($HBoxContainer/Pseudolocalizer/Key.text)
	pass


func _on_doublevowels_toggled(button_pressed):
	ProjectSettings.set("internationalization/pseudolocalization/double_vowels", button_pressed)
	TranslationServer.reload_pseudolocalization()
	pass


func _on_expansion_ratio_text_changed():
	float()
	var ratio = ($HBoxContainer/Pseudolocalization_options/exp_ratio/TextEdit.text).to_float()
	if ratio > 1:
		ratio = 1
		$HBoxContainer/Pseudolocalization_options/exp_ratio/TextEdit.text = str(ratio)
	if ratio < 0:
		ratio = 0 
		$HBoxContainer/Pseudolocalization_options/exp_ratio/TextEdit.text = str(ratio)
	ProjectSettings.set("internationalization/pseudolocalization/expansion_ratio", ratio)
	TranslationServer.reload_pseudolocalization()
	pass


func _on_override_toggled(button_pressed):
	ProjectSettings.set("internationalization/pseudolocalization/override", button_pressed)
	TranslationServer.reload_pseudolocalization()
	pass


func _on_skipplaceholders_toggled(button_pressed):
	ProjectSettings.set("internationalization/pseudolocalization/skip_placeholders", button_pressed)
	TranslationServer.reload_pseudolocalization()
	pass
