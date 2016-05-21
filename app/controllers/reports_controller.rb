class ReportsController < ApplicationController

  def index

    @chefs = Participant.select("participants.*, COUNT(votes.id) vote_count").joins("LEFT OUTER JOIN votes ON votes.participant_id = participants.id").where(category: 1).group("participants.id").order("vote_count DESC")

    @mixologists = Participant.select("participants.*, COUNT(votes.id) vote_count").joins("LEFT OUTER JOIN votes ON votes.participant_id = participants.id").where(category: 2).group("participants.id").order("vote_count DESC")

    render('/reports/index')
  end

end

