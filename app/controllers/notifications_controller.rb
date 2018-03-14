class NotificationsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:mark_as_read]

	def index
		@notifications = Notification.where(recipient: current_user).unread
	end

	def mark_as_read
		@notifications = Notification.where(recipient: current_user).unreads
		@notifications.update_all(read_at: Time.zone.now)
		render json: {success:true}
	end
end
