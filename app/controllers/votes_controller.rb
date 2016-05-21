class VotesController < ApplicationController


  def  index
    @chefs = Participant.where(:category => 1).shuffle
    @mixologists = Participant.where(:category => 2).shuffle
    render('/votes/index')
  end

  def  create
    chefvote_id=0
    mixvote_id=0

    if vote_params[:chef_id].present?
      chefvote = Vote.create(:complete => true, :participant_id => vote_params[:chef_id])
      chefvote_id = chefvote.id
    end
    if vote_params[:mixologist_id].present?
      mixvote = Vote.create(:complete => true, :participant_id => vote_params[:mixologist_id])
      mixvote_id=mixvote.id
    end

    if (chefvote_id + mixvote_id) > 0     #the values of the id's should be more than zero if save propelrly
      flash[:heading] = "Thank you!"
      flash[:notice] = "Your voted has been recorded."
      redirect_to votes_path
    else
      flash[:heading] = "Error"
      flash[:notice] = "No chefs or mixologists selected."
      redirect_to votes_path
    end

  end

  protected

  def vote_params
    params.permit(:chef_id, :mixologist_id)
  end

end