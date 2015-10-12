class RuleQualifiesController < ApplicationController
  before_action :set_rule, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def create
  end
  
  def destroy
  end
  
  def update
  end
  
  def new
  end
  
  private
  def set_rule
    @rule = RuleQualify.find(params["id"])
  end
end
