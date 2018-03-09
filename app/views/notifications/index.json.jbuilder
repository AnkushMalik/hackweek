json.array! @notifications do |notification|
	json.id notification.id
	json.actor notification.actor
	json.action notification.action
	json.notifiable notification.notifiable
	if notification.notifiable.class == User
		json.url user_path(notification.notifiable, anchor: dom_id(notification.notifiable))
	end
	if notification.notifiable.class == Project
		json.url project_path(id: notification.notifiable_id, anchor: dom_id(notification.notifiable))
	end
end
