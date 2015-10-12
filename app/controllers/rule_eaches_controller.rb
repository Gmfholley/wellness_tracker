class RuleEachesController < ApplicationController
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
    respond_to do |format|
      if @rule.destroy
        format.html { redirect_to organization_challenge_path(@organization.id, @challenge.id), notice: 'Challenge was successfully created.' }
        format.json {render json: @challenge, status: :destroyed}
      else
        format.html { redirect_to organization_challenge_path(@organization.id, @challenge.id), notice: @rule.errors  }
        format.json {render json: @rule.errors, status: :unprocessable_entity}
      end  
    end
  end
  
  def update
  end
  
  def new
  end
  
  private
  def set_rule
    @rule = RuleEach.find(params["id"])
    @challenge = @rule.challenge.includes(:organization, :rule_eaches, :rule_totals, :rule_qualifies)
    @organization = @challenge.organization
  end
  
  def rule_params
    
  end
end
