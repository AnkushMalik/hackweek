class Notifications
	constructor: ->
		@notifications = $("[data-behavior='notifications']")
		@setup() if @notifications.length

	setup: ->
		$('#notification_dropdown_activator').on 'click',@mark_read
		$.ajax(
			url:'/notifications.json'
			dataType:'JSON'
			method: 'GET'
			success: @showNoti
		)

	mark_read: (e) =>
		$.ajax(
			url: '/notifications/mark_as_read'
			dataType:'JSON'
			method: 'POST'
			success: ->
				$('#notification_count').css('display','none');
		)

	showNoti: (data) =>
		console.log(data)
		items = $.map data, (notification) ->
			"<li style='white-space: pre-wrap;' data-behavior='notifications-link'><a class='notificationlinks' href='#{notification.url}' target='_blank'>#{notification.actor.name} #{notification.action}: #{notification.notifiable.title}</a></li>"
		items+="<li style='white-space: pre-wrap;' data-behavior='notifications-link'><a href='#!'>* See Older Notifications *</a></li>"
		items = items.replace(/,/g , "");
		if(data.length)
			$('#notification_count').html(data.length).css('display','inline-block');
			$('#notification_dropdown').html(items);
jQuery ->
	setInterval (->
	  new Notifications
	), 10000