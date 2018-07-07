json.array! @notifications do |notification|
	json.id notification.id
	json.recipient notification.recipient
	json.actor notification.actor
	json.action notification.action
	json.notifiable notification.notifiable
	json.avatar notification.notifiable.avatar.url(:thumb)

	if notification.notifiable.avatar.url(:thumb).slice(0..5) == 'avatar'
		json.avatar "/assets/#{notification.notifiable.avatar.url(:thumb)}"
	else
		json.avatar notification.notifiable.avatar.url(:thumb)
	end

	json.url "/projects/#{notification.notifiable.id}"
end
