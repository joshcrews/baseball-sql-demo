# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130722154252) do

  create_table "games", force: true do |t|
    t.integer "host_team_id"
    t.integer "guest_team_id"
    t.date    "played_on",        null: false
    t.integer "host_team_score",  null: false
    t.integer "guest_team_score", null: false
  end

  add_index "games", ["guest_team_id"], name: "index_games_on_guest_team_id", using: :btree
  add_index "games", ["host_team_id"], name: "index_games_on_host_team_id", using: :btree

  create_table "leagues", force: true do |t|
    t.string "name", null: false
  end

  create_table "player_game_stats", force: true do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.string  "name",      null: false
    t.integer "value",     null: false
  end

  add_index "player_game_stats", ["game_id"], name: "index_player_game_stats_on_game_id", using: :btree
  add_index "player_game_stats", ["player_id"], name: "index_player_game_stats_on_player_id", using: :btree

  create_table "players", force: true do |t|
    t.string "name",      null: false
    t.date   "birthdate"
  end

  create_table "players_seasons", force: true do |t|
    t.integer "team_season_id"
    t.integer "player_id"
    t.integer "jersey_number"
  end

  add_index "players_seasons", ["player_id"], name: "index_players_seasons_on_player_id", using: :btree
  add_index "players_seasons", ["team_season_id"], name: "index_players_seasons_on_team_season_id", using: :btree

  create_table "team_seasons", force: true do |t|
    t.string  "year",    null: false
    t.integer "team_id"
  end

  add_index "team_seasons", ["team_id"], name: "index_team_seasons_on_team_id", using: :btree

  create_table "teams", force: true do |t|
    t.string  "name",      null: false
    t.integer "league_id"
  end

  add_index "teams", ["league_id"], name: "index_teams_on_league_id", using: :btree

end
