class Api::GamesController < ApplicationController

  def index
    @games = Game.all
    render json: @games
  end

  def create
    # this will work but we need to be able to source the user_id from the page
    # in some way. If the only way to start a new user would be to refresh the page
    # then we could set it to where there is a dataset attribute that holds the ID
    # ' data-user-id="" ' on the div element of the game, and then whenever a
    # user enters his/her 3 letter alias and that is stored in our database we
    # can take the ID from the returned JSON object and set the 'data-user-id'
    # attribute equal to the returned ID value of the newly created user.

    # In this early
    # version of our game we will not have a system where an old user can sign
    # back in - instead if you are the same person and would like to play again
    # you will just use the same 3 letter alias, and if someone else uses that alias
    # as well that's OK. Operates similar to the older style arcade games in this
    # manner.
    @game = Game.create(game_params)
    render json: @game, status: 201
  end

  private

  def game_params
    params.require(:game).permit(:score, :user_id)
  end

end
