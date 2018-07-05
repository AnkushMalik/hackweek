class Notifications
	constructor: ->
		@notifications = $('[data-behavior = "notifications"]')
		@setup() if @notifications.length

	setup: ->
		$('#notification-dropdown-activator').on 'click', @mark_read
		$.ajax(
			url:'/notifications.json'
			dataType: 'JSON'
			method: 'GET'
			global: false
			success: @showNoti
		)

	mark_read: (e) =>
		$.ajax(
			url: '/notifications/mark_as_read'
			dataType: 'JSON'
			method: 'POST'
			global: false
			success: ->
				$('#notification-count').css('display','none');
		)

	showNoti: (data) =>
		items = $.map data, (notification) ->
			"<li style='white-space: pre-wrap;' data-behavior='notifications-link'><a class='notificationlinks' href='#{notification.url}' target='_blank'>#{notification.actor.name} #{notification.action}</a></li>"
		items += "<li style='white-space: pre-wrap;' data-behavior='notifications-link'><a href='#'>Older Notification</a></li>"
		if(data.length)
			$('#notification-count').css('display','inline-block');
			$('#notification-count').html(data.length);
			$('#notification-dropdown').html(items);
jQuery ->
	new Notifications
	setInterval (->
	  new Notifications
	), 30000
