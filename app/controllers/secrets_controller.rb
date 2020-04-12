# frozen_string_literal: true

class SecretsController < ApplicationController
  before_action :set_secret, only: %i[show edit update destroy]

  # GET /secrets
  # GET /secrets.json
  def index
    @secrets = Secret.all.order(updated_at: :desc)
  end

  # GET /secrets/new
  def new
    @secret = Secret.new
  end

  # GET /secrets/1/edit
  def edit; end

  # POST /secrets
  # POST /secrets.json
  def create
    @secret = Secret.new(secret_params)

    respond_to do |format|
      if @secret.save
        format.html { redirect_to secrets_url, notice: 'Secret was successfully created.' }
        format.json { head :created }
      else
        format.html { render :new }
        format.json { render json: @secret.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secrets/1
  # PATCH/PUT /secrets/1.json
  def update
    respond_to do |format|
      if @secret.update(secret_params)
        format.html { redirect_to secrets_url, notice: 'Secret was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :edit }
        format.json { render json: @secret.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secrets/1
  # DELETE /secrets/1.json
  def destroy
    @secret.destroy
    respond_to do |format|
      format.html { redirect_to secrets_url, notice: 'Secret was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_secret
    @secret = Secret.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def secret_params
    params.require(:secret).permit(:name, :value, :domain)
  end
end
