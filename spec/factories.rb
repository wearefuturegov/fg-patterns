FactoryBot.define do

  factory :pattern do
    name { "Check something" }
    description { "Lorem ipsum dolor amet fanny pack cray vice, single-origin coffee vape raw denim skateboard marfa meditation sriracha locavore drinking vinegar brooklyn meggings. Taiyaki edison bulb snackwave iPhone vice, echo park tacos selvage polaroid offal. Echo park truffaut next level, skateboard freegan coloring book vinyl. Selvage street art gochujang stumptown celiac hot chicken pok pok waistcoat affogato 90's cardigan mixtape." }
  end

  factory :service do
    name { "New service" }
    steps { "met fanny pack cray vice, single-origin coffee vape raw > Lorem ipsum dolor amet fanny pack cray vice" }
    patterns { [Pattern.first, Pattern.last] }
    life_events { [LifeEvent.first, LifeEvent.last]}
    organisation_types { [Service.organisation_types.first, Service.organisation_types.last] }
    suggester_name { "Sir Vice" }
    suggester_email { "exampe@wearefuturegov.com" }
    suggester_organisation { "FutureGov" }
  end
end