# frozen_string_literal: true

# Messages controller
class MessagesController < ApplicationController
  before_action :set_message, only: %i[edit update destroy]

  def home; end

  def index
    @messages = Message.order(id: :desc)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    return if @message.save

    render :new, status: :unprocessable_entity
  end

  def edit; end

  def update
    return if @message.update(message_params)

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @message.destroy

    render turbo_stream: turbo_stream.remove(@message)
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
