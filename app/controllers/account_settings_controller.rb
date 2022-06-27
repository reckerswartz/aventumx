# frozen_string_literal: true

class AccountSettingsController < ApplicationController
  before_action :set_account_setting, only: %i[show edit update destroy]

  # GET /account_settings or /account_settings.json
  def index
    @account_settings = AccountSetting.all
  end

  # GET /account_settings/1 or /account_settings/1.json
  def show; end

  # GET /account_settings/new
  def new
    @account_setting = AccountSetting.new
  end

  # GET /account_settings/1/edit
  def edit; end

  # POST /account_settings or /account_settings.json
  def create
    @account_setting = AccountSetting.new(account_setting_params)

    respond_to do |format|
      if @account_setting.save
        format.html { redirect_to account_setting_url(@account_setting), notice: 'Account setting was successfully created.' }
        format.json { render :show, status: :created, location: @account_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_settings/1 or /account_settings/1.json
  def update
    respond_to do |format|
      if @account_setting.update(account_setting_params)
        format.html { redirect_to account_setting_url(@account_setting), notice: 'Account setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @account_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_settings/1 or /account_settings/1.json
  def destroy
    @account_setting.destroy

    respond_to do |format|
      format.html { redirect_to account_settings_url, notice: 'Account setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account_setting
    @account_setting = AccountSetting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_setting_params
    params.fetch(:account_setting, {})
  end
end
