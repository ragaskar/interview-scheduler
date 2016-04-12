class PeopleController < ApplicationController
  def show
    person = Person.find(params[:id])
    render json: person
  end

  def create
    person = Person.new(person_params)

    if person.save
      render json: person, status: :created, location: person
    else
      render json: person.errors, status: :unprocessable_entity
    end
  end

  private
    def person_params
      params.require(:person).permit(:first_name, :last_name)
    end
end
