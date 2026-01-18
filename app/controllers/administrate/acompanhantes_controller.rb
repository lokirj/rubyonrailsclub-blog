# frozen_string_literal: true

module Administrate
  class AcompanhantesController < ApplicationController
    before_action :set_acompanhante, only: [:show, :edit, :update, :destroy, :destroy_img_destaque_1, :destroy_img_destaque_2, :destroy_img_destaque_3, :destroy_img_destaque_4, :destroy_img_destaque_5, :destroy_img_destaque_6]

    layout "acompanhantes"

    # GET /acompanhantes or /acompanhantes.json
    def index
      @acompanhantes = Acompanhante.all
    end

    # GET /acompanhantes/1 or /acompanhantes/1.json
    def show
    end

    # GET /acompanhantes/new
    def new
      @acompanhante = Acompanhante.new
    end

    # GET /acompanhantes/1/edit
    def edit
    end

    # POST /acompanhantes or /acompanhantes.json
    def create
      @acompanhante = Acompanhante.new(acompanhante_params)
      @acompanhante.img_destaque_1.attach(article_params[:img_destaque_1])
      @acompanhante.img_destaque_2.attach(article_params[:img_destaque_2])
      @acompanhante.img_destaque_3.attach(article_params[:img_destaque_3])
      @acompanhante.img_destaque_4.attach(article_params[:img_destaque_4])
      @acompanhante.img_destaque_5.attach(article_params[:img_destaque_5])
      @acompanhante.img_destaque_6.attach(article_params[:img_destaque_6])

      respond_to do |format|
        if @acompanhante.save
          format.html { redirect_to([:administrate, @acompanhante], notice: "Acompanhante was successfully created.") }
          format.json { render(:show, status: :created, location: @acompanhante) }
        else
          format.html { render(:new, status: :unprocessable_entity) }
          format.json { render(json: @acompanhante.errors, status: :unprocessable_entity) }
        end
      end
    end

    # PATCH/PUT /acompanhantes/1 or /acompanhantes/1.json
    def update
      respond_to do |format|
        if @acompanhante.update(acompanhante_params)
          format.html { redirect_to([:administrate, @acompanhante], notice: "Acompanhante was successfully updated.", status: :see_other) }
          format.json { render(:show, status: :ok, location: @acompanhante) }
        else
          format.html { render(:edit, status: :unprocessable_entity) }
          format.json { render(json: @acompanhante.errors, status: :unprocessable_entity) }
        end
      end
    end

    # DELETE /acompanhantes/1 or /acompanhantes/1.json
    def destroy
      @acompanhante.destroy!

      respond_to do |format|
        format.html { redirect_to(administrate_acompanhantes_path, notice: "Acompanhante was successfully destroyed.", status: :see_other) }
        format.json { head(:no_content) }
      end
    end

    # DELETE /administrate/articles/:id/destroy_cover_image
    def destroy_img_destaque_1
      @acompanhante.img_destaque_1.purge

      respond_to do |format|
        format.turbo_stream { render(turbo_stream: turbo_stream.remove("id_img_destaque_1")) }
      end
    end

    # DELETE /administrate/articles/:id/destroy_cover_image
    def destroy_img_destaque_2
      @acompanhante.img_destaque_2.purge

      respond_to do |format|
        format.turbo_stream { render(turbo_stream: turbo_stream.remove("id_img_destaque_2")) }
      end
    end

    # DELETE /administrate/articles/:id/destroy_cover_image
    def destroy_img_destaque_3
      @acompanhante.img_destaque_3.purge

      respond_to do |format|
        format.turbo_stream { render(turbo_stream: turbo_stream.remove("id_img_destaque_3")) }
      end
    end

    # DELETE /administrate/articles/:id/destroy_cover_image
    def destroy_img_destaque_4
      @acompanhante.img_destaque_4.purge

      respond_to do |format|
        format.turbo_stream { render(turbo_stream: turbo_stream.remove("id_img_destaque_4")) }
      end
    end

    # DELETE /administrate/articles/:id/destroy_cover_image
    def destroy_img_destaque_5
      @acompanhante.img_destaque_5.purge

      respond_to do |format|
        format.turbo_stream { render(turbo_stream: turbo_stream.remove("id_img_destaque_5")) }
      end
    end

    # DELETE /administrate/articles/:id/destroy_cover_image
    def destroy_img_destaque_6
      @acompanhante.img_destaque_6.purge

      respond_to do |format|
        format.turbo_stream { render(turbo_stream: turbo_stream.remove("id_img_destaque_6")) }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_acompanhante
      @acompanhante = Acompanhante.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def acompanhante_params
      params.require(:acompanhante).permit(:nome, :idade, :altura, :peso, :manequin, :pes, :cabelos, :olhos, :tipo, :biotipo, :cpf, :pais, :estado, :cidade, :bairro, :logradouro, :img_destaque_1, :img_destaque_2, :img_destaque_3, :img_destaque_4, :img_destaque_5, :img_destaque_6)
    end
  end
end
