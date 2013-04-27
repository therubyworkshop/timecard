class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
    add_breadcrumb "Cards", cards_path
    add_breadcrumb @card.name, card_path(@card)
  end

  def new
    @card = Card.new
    add_breadcrumb "Cards", cards_path
    add_breadcrumb "New"
  end

  def edit
    @card = Card.find(params[:id])
    add_breadcrumb "Cards", cards_path
    add_breadcrumb @card.name, card_path(@card)
  end

  def create
    @card = Card.new(params[:card])
    if @card.save
      redirect_to cards_url, notice: 'Card was successfully created.'
    else
      add_breadcrumb "Cards", cards_path
      add_breadcrumb @card.name
      render action: "new"
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(params[:card])
      redirect_to cards_url, notice: 'Card was successfully updated.'
    else
      add_breadcrumb "Cards", cards_path
      add_breadcrumb @card.name, card_path(@card)
      render action: "edit"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_url
  end
end
