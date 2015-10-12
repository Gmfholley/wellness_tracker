class RuleTotalsController < ApplicationController
  before_action :set_rule, only: [:show, :edit, :destroy, :update]
  
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
    @rule = RuleTotal.find(params["id"])
  end
end
