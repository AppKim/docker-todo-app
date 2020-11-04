# frozen_string_literal: true

module Api
  class TasksController < ApplicationController
    # GET /tasks
    def index
      # 後々のため、更新順で返します
      @tasks = Task.order('updated_at DESC')
      # logger.debug "task: #{@tasks.to_yaml}"
    end

    # POST /tasks
    def create
      @task = Task.new(task_params)

      if @task.save
        render :show, status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tasks/{id}
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        render :show, status: :ok
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tasks/{id}
    def destroy
      @task = Task.find(params[:id])
      if @task.destroy
        render :show, status: :ok
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tasks
    def destroy_all
      if Task.destroy_all
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.fetch(:task, {}).permit(
        :name, :is_done
      )
    end
  end
end
