class Game < ActiveRecord::Base
  belongs_to :host_team, class_name: 'Team'
  belongs_to :guest_team, class_name: 'Team'
end
