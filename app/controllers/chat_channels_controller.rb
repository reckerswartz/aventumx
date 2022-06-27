# frozen_string_literal: true

class ChatChannelsController < ApplicationController
  before_action :set_chat_channel, only: %i[show edit update destroy]

  # GET /chat_channels or /chat_channels.json
  def index
    @chat_channels = ChatChannel.all
  end

  # GET /chat_channels/1 or /chat_channels/1.json
  def show; end

  # GET /chat_channels/new
  def new
    @chat_channel = ChatChannel.new
  end

  # GET /chat_channels/1/edit
  def edit; end

  # POST /chat_channels or /chat_channels.json
  def create
    @chat_channel = ChatChannel.new(chat_channel_params)

    respond_to do |format|
      if @chat_channel.save
        format.html { redirect_to chat_channel_url(@chat_channel), notice: 'Chat channel was successfully created.' }
        format.json { render :show, status: :created, location: @chat_channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chat_channels/1 or /chat_channels/1.json
  def update
    respond_to do |format|
      if @chat_channel.update(chat_channel_params)
        format.html { redirect_to chat_channel_url(@chat_channel), notice: 'Chat channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @chat_channel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chat_channels/1 or /chat_channels/1.json
  def destroy
    @chat_channel.destroy

    respond_to do |format|
      format.html { redirect_to chat_channels_url, notice: 'Chat channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chat_channel
    @chat_channel = ChatChannel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def chat_channel_params
    params.require(:chat_channel).permit(:name, :status, :private, :personal)
  end
end
