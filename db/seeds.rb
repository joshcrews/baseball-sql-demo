League.destroy_all
Team.destroy_all
Game.destroy_all
Player.destroy_all
PlayerGameStat.destroy_all
PlayersSeason.destroy_all
TeamSeason.destroy_all

years = [2011, 2012, 2013]
league_names = ['Tee Ball', 'Coach Pitch', 'Fast Pitch']
team_names = %w(Spiders Badgers Tigers Pomodoros Baguettes Roses Lizards Mice Baristas Sombreros Trees Gorillas)
stat_names = ['Homerun', 'Hit', 'Strike out', 'At bat', 'Double', 'Triple']

# create leagues
league_names.each {|n| League.create!(name: n)}

# create teams
team_names.each{|n| Team.create!(name: n, league: League.all.sample)}

# create seasons
Team.all.each do |team|
  years.each{|year| TeamSeason.create!(team: team, year: year)}
end

# create players

50.times do

  Player.create!(
    name: Forgery(:name).full_name,
    birthdate: (8..15).to_a.sample.years.ago 
  )

end

# create player seasons


Player.all.each do |player|
  years.each do |year|
    PlayersSeason.create!(
      team_season: TeamSeason.where(year: year.to_s).sample,
      player: player,
      jersey_number: (1..99).to_a.sample
    )
  end
end

# create games

League.all.each do |league|
  league.teams.each do |team|
    team.team_seasons.each do |team_season|
      other_team = Team.where.not(id: team.id).where(league_id: league.id)
      other_team.each do |other_team|

        game = Game.create!(
          played_on: "#{team_season.year}-#{rand(12) + 1}-15".to_date,
          host_team: team,
          guest_team: other_team,
          host_team_score: rand(10),
          guest_team_score: rand(10)
        )

        # create player game stats

        all_players = team_season.players + TeamSeason.where(year: team_season.year, team: other_team).first.players

        all_players.each do |player|
          stat_names.each do |stat_name|
            PlayerGameStat.create!(
              name: stat_name,
              value: rand(4) / 2,
              player: player,
              game: game
            )
          end
        end
        
      end
      
    end
  end
  
end



