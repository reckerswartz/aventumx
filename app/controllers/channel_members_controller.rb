# frozen_string_literal: true

class ChannelMembersController < ApplicationController
  before_action :set_channel_member, only: %i[show edit update destroy]

  # GET /channel_members or /channel_members.json
  def index
    @channel_members = ChannelMember.all
  end

  # GET /channel_members/1 or /channel_members/1.json
  def show; end

  # GET /channel_members/new
  def new
    @channel_member = ChannelMember.new
  end

  # GET /channel_members/1/edit
  def edit; end

  # POST /channel_members or /channel_members.json
  def create
    @channel_member = ChannelMember.new(channel_member_params)

    respond_to do |format|
      if @channel_member.save
        format.html { redirect_to channel_member_url(@channel_member), notice: 'Channel member was successfully created.' }
        format.json { render :show, status: :created, location: @channel_member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @channel_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channel_members/1 or /channel_members/1.json
  def update
    respond_to do |format|
      if @channel_member.update(channel_member_params)
        format.html { redirect_to channel_member_url(@channel_member), notice: 'Channel member was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel_member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @channel_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channel_members/1 or /channel_members/1.json
  def destroy
    @channel_member.destroy

    respond_to do |format|
      format.html { redirect_to channel_members_url, notice: 'Channel member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_channel_member
    @channel_member = ChannelMember.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def channel_member_params
    params.require(:channel_member).permit(:status)
  end
end
