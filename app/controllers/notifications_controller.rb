# app/controllers/notifications_controller.rb
class NotificationsController < ApplicationController
  before_action :set_trigger
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  # GET /triggers/:trigger_id/notifications
  def index
    @notifications = @trigger.notifications
  end

  # GET /triggers/:trigger_id/notifications/1
  def show
  end

  # GET /triggers/:trigger_id/notifications/new
  def new
    @notification = @trigger.notifications.new
  end

  # GET /triggers/:trigger_id/notifications/1/edit
  def edit
  end

  # POST /triggers/:trigger_id/notifications
  def create
    @notification = @trigger.notifications.new(notification_params)

    if @notification.save
      redirect_to [@trigger, @notification], notice: 'Notification was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /triggers/:trigger_id/notifications/1
  def update
    if @notification.update(notification_params)
      redirect_to [@trigger, @notification], notice: 'Notification was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /triggers/:trigger_id/notifications/1
  def destroy
    @notification.destroy
    redirect_to trigger_notifications_url(@trigger), notice: 'Notification was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trigger
      @trigger = Trigger.find(params[:trigger_id])
    end

    def set_notification
      @notification = @trigger.notifications.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_params
      params.require(:notification).permit(:content)
    end
end
  