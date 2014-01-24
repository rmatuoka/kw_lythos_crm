class GoalsController < ApplicationController
  def index   
    @goals = Goal.all
  end

  def new            
    @goal = Goal.new  
    @sellers = User.all(:select => "`users`.*, `collaborators_users`.`user_id` as `supervisor`", 
                        :joins => "INNER JOIN `collaborators_users` on `users`.`id` = `collaborators_users`.`collaborator_id`",
                        :order => `supervisor`)
  end
  
  def create
    @goal = Goal.new(params[:goal]) 
    if @goal.save
      params[:goal][:sellers].each do |key,value|
         @goal_seller = GoalsSellers.new  
         @goal_seller.goal_id = @goal.id
         @goal_seller.user_id = key
         @goal_seller.value = value  
         @goal_seller.save       
      end
      redirect_to goal_path(@goal), :notice => "Successfully created goal."
    else
      render :action => 'new'
    end    
  end
  
  def edit
  end

  def show
    @goal = Goal.find(params[:id])
    @goal_sellers = GoalsSellers.all(:conditions =>["goal_id = ?", @goal.id])
  end
end
