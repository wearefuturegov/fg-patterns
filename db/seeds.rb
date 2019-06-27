require 'csv'

#patterns = File.read(Rails.root.join('lib', 'seeds', 'patterns'))


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

patterns = [
  {
    name: "Check something",
    description: "<p>This pattern enables a person to look up a piece of information and understand if applies to them or their circumstances. When an eligibility check can be done independently, it should be considered part of this pattern.</p>
                  <p><strong>Tip:</strong> Is the user looking for specific  information (the status of something, the closest location or eligibility)?</p>"
  },
  {
    name: "Register for something",
    description: "<p>This pattern enables the user to complete a process (like booking something). By registering, users will create an account with personal and sensitive data that they can return to. </p>
                  <p><strong>Tip:</strong> Is the user being asked to supply personal details to a type of account?</p>"
  },
  {
    name: "Tell something",
    description: "<p>This pattern enables a person who needs/wants to give some information to the council, like a referral or to report something.</p>
                  <p><strong>Tip:</strong> Is the user getting in contact with the council to update something or inform the council about something?</p>"
  },
  {
    name: "Request something",
    description: "<p>This pattern enables the user to ask for something in order to get to some tangible outcomes. Typically there is no eligibility check, because the user is entitled to what s/he wants by default.</p>
                  <p><strong>Tip:</strong> Is the user being asked to request something to complete a task?</p>"
  },
  {
    name: "Apply for something",
    description: "<p>This pattern enables the user to complete an application process.</p>
                  <p><strong>Tip:</strong> Is the user being asked to submit a type of application to complete a task?</p>"
  },
  {
    name: "Book something",
    description: "<p>This pattern enables the user to book things such as a room, an item or a person’s time.
                  In the majority of the cases, a specific date and time need to be selected.</p>
                  <p><strong>Tip:</strong> Is the user being asked to book something in order to complete a task?</p>"
  },
  {
    name: "Pay for something",
    description: "<p>This pattern enables the user to complete a monetary transaction towards the council.</p>
                  <p><strong>Tip:</strong> Is the user being asked to complete a monetary transaction?</p>"
  }
]
patterns.each do |pattern|

  # Create pattern
  new_pattern = Pattern.create(pattern)

  # Construct path for pattern csv file
  file_name = new_pattern.name.split(" ")[0].downcase
  pattern_csv_path = Rails.root.join('lib', 'seeds', 'patterns', file_name + '.csv')

  if File.exist?(pattern_csv_path)
    # Read CSV from file
    csv = File.read(pattern_csv_path)
    pattern_csv = CSV.parse(csv, headers: true)

    # Iterate through services for that pattern
    pattern_csv.each do |row|
      name_string = row[0]
      name_string.strip! # Trim any whitespace from beginning and end

      if name_string.include? "NT"
        transactional = false
        name_string.slice!("(NT) ")
        name_string.slice!("(NT)")
      else
        transactional = true
      end

      service = Service.where(name: name_string).first || Service.new
      service.seed = true
      service.status = 'published'

      if transactional
        service.transactional = true
      else
        service.transactional = false
      end

      service.name ||= name_string
      service.steps ||= row[1]
      if row[2] # life events
        life_event_names = row[2].split(', ')
        life_events = []
        life_event_names.each  do |life_event_name|
          life_events << LifeEvent.find_or_create_by(name: life_event_name)
        end

        life_events.each do |life_event|
          unless service.life_events.exists?(life_event.id)
            service.life_events << life_event
          end
        end
      end
      service.patterns << new_pattern
      service.organisation_types = ["County council"]
      service.save
    end
  end

end

# services = [
#   "Register a birth",
#   "Register a death",
#   "Register a stillbirth",
#   "Plan a naming ceremony / Venue",
#   "Plan a naming ceremony / Registrar"
# ]

# [
#   id: ,
#   name: "",
#   description: ""
# ]

