json.array! @notifications do |notification|
	json.id notification.id
	json.recipient notification.recipient
	json.actor notification.actor
	json.action notification.action
	json.notifiable notification.notifiable
	if notification.notifiable.class == Project
		json.url "/projects/#{notification.notifiable.id}"
	end
end
