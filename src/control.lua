function handle_paste(event)
	local source = event.source
	local dest = event.destination
	if not (source and source.valid) then return end
	if not (dest and dest.valid) then return end
	if source.type ~= "electric-pole" then return end
	if dest.type ~= "constant-combinator" then return end

	local signals = source.get_merged_signals()
	local control = dest.get_or_create_control_behavior()
	for slot=1,control.signals_count do
		if signals and signals[slot] then
			control.set_signal(slot, signals[slot])
		else
			control.set_signal(slot, nil)
		end
	end
end

script.on_event(defines.events.on_entity_settings_pasted, handle_paste)
