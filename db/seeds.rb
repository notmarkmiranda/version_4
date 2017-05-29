user = User.create(email: "markmiranda51@gmail.com", password: "UP3iG7Ks2HriXpzi")

# league
league = League.create(name: "mike cassano", user_id: user.id)

# seasons
season = league.seasons.first


# participants
m_cassano   = Participant.create(first_name: "Michael", last_name: "Cassano", user_id: user.id)
s_lyndon    = Participant.create(first_name: "Shawn", last_name: "Lyndon", user_id: user.id)
m_miranda   = Participant.create(first_name: "Mark", last_name: "Miranda", user_id: user.id)
t_merry     = Participant.create(first_name: "Tyler", last_name: "Merry", user_id: user.id)
b_yang      = Participant.create(first_name: "Bobby", last_name: "Yang", user_id: user.id)
z_moore     = Participant.create(first_name: "Zach", last_name: "Moore", user_id: user.id)
a_baum      = Participant.create(first_name: "Andy", last_name: "Baum", user_id: user.id)
c_kampe     = Participant.create(first_name: "Chris", last_name: "Kampe", user_id: user.id)
j_mann      = Participant.create(first_name: "Jonathan", last_name: "Mann", user_id: user.id)
e_starling  = Participant.create(first_name: "Eric", last_name: "Starling", user_id: user.id)
m_green     = Participant.create(first_name: "Mike", last_name: "Green", user_id: user.id)
a_schindler = Participant.create(first_name: "Alan", last_name: "Schindler", user_id: user.id)
h_desroches = Participant.create(first_name: "Henry", last_name: "Desroches", user_id: user.id)
r_gavrilov  = Participant.create(first_name: "Roman", last_name: "Gavrilov", user_id: user.id)
j_mortenson = Participant.create(first_name: "Jesse", last_name: "Mortenson", user_id: user.id)
s_lukes     = Participant.create(first_name: "Scott", last_name: "Lukes", user_id: user.id)
m_harris    = Participant.create(first_name: "Mark", last_name: "Harris", user_id: user.id)
j_balu      = Participant.create(first_name: "Jeremy", last_name: "Balu", user_id: user.id)
j_bogdan    = Participant.create(first_name: "Julius", last_name: "Bogdan", user_id: user.id)
a_fullerton = Participant.create(first_name: "Andrew", last_name: "Fullerton", user_id: user.id)
e_austin    = Participant.create(first_name: "Eric", last_name: "Austin", user_id: user.id)
b_iverson   = Participant.create(first_name: "Bjorn", last_name: "Iverson", user_id: user.id)
z_other     = Participant.create(first_name: "Zach", last_name: "Other", user_id: user.id)

# 1
game_1 = Game.create(date: Date.new(2015, 11, 5), buy_in: 15, completed: true, season_id: season.id, attendees: 6)
Player.create(participant_id: m_cassano.id, finishing_place: 1, game_id: game_1.id, additional_expense: 0)
Player.create(participant_id: s_lyndon.id, finishing_place: 2, game_id: game_1.id, additional_expense: 0)
Player.create(participant_id: m_miranda.id, finishing_place: 3, game_id: game_1.id, additional_expense: 0)
# Player.create(participant_id: t_merry.id, finishing_place: 4, game_id: game_1.id, additional_expense: 0)
# Player.create(participant_id: b_yang.id, finishing_place: 5, game_id: game_1.id, additional_expense: 0)
# Player.create(participant_id: z_moore.id, finishing_place: 6, game_id: game_1.id, additional_expense: 0)

# 2
game_2 = Game.create(date: Date.new(2015, 12, 5), buy_in: 15, completed: true, season_id: season.id, attendees: 7)
Player.create(participant_id: m_miranda.id, finishing_place: 1, game_id: game_2.id, additional_expense: 0)
Player.create(participant_id: t_merry.id, finishing_place: 2, game_id: game_2.id, additional_expense: 0)
Player.create(participant_id: a_baum.id, finishing_place: 3, game_id: game_2.id, additional_expense: 0)
# Player.create(participant_id: b_yang.id, finishing_place: 4, game_id: game_2.id, additional_expense: 0)
# Player.create(participant_id: c_kampe.id, finishing_place: 5, game_id: game_2.id, additional_expense: 0)
# Player.create(participant_id: m_cassano.id, finishing_place: 6, game_id: game_2.id, additional_expense: 0)
# Player.create(participant_id: z_moore.id, finishing_place: 7, game_id: game_2.id, additional_expense: 0)

# 3
game_3 = Game.create(date: Date.new(2016, 1, 5), buy_in: 15, completed: true, season_id: season.id, attendees: 7)
Player.create(participant_id: a_baum.id, finishing_place: 1, game_id: game_3.id, additional_expense: 0)
Player.create(participant_id: m_miranda.id, finishing_place: 2, game_id: game_3.id, additional_expense: 0)
Player.create(participant_id: c_kampe.id, finishing_place: 3, game_id: game_3.id, additional_expense: 0)
# Player.create(participant_id: b_yang.id, finishing_place: 4, game_id: game_3.id, additional_expense: 0)
# Player.create(participant_id: s_lyndon.id, finishing_place: 5, game_id: game_3.id, additional_expense: 0)
# Player.create(participant_id: m_cassano.id, finishing_place: 6, game_id: game_3.id, additional_expense: 0)
# Player.create(participant_id: t_merry.id, finishing_place: 7, game_id: game_3.id, additional_expense: 0)

# 4
game_4 = Game.create(date: Date.new(2016, 2, 15), buy_in: 15, completed: true, season_id: season.id, attendees: 6)
Player.create(participant_id: s_lyndon.id, finishing_place: 1, game_id: game_4.id, additional_expense: 0)
Player.create(participant_id: m_miranda.id, finishing_place: 2, game_id: game_4.id, additional_expense: 0)
Player.create(participant_id: z_moore.id, finishing_place: 3, game_id: game_4.id, additional_expense: 0)
# Player.create(participant_id: t_merry.id, finishing_place: 4, game_id: game_4.id, additional_expense: 0)
# Player.create(participant_id: c_kampe.id, finishing_place: 5, game_id: game_4.id, additional_expense: 0)
# Player.create(participant_id: m_cassano.id, finishing_place: 6, game_id: game_4.id, additional_expense: 0)

# 5
game_5 = Game.create(date: Date.new(2016, 3, 15), buy_in: 15, completed: true, season_id: season.id, attendees: 7)
Player.create(participant_id: m_cassano.id, finishing_place: 1, game_id: game_5.id, additional_expense: 0)
Player.create(participant_id: s_lyndon.id, finishing_place: 2, game_id: game_5.id, additional_expense: 0)
Player.create(participant_id: a_baum.id, finishing_place: 3, game_id: game_5.id, additional_expense: 0)
# Player.create(participant_id: b_yang.id, finishing_place: 4, game_id: game_5.id, additional_expense: 0)
# Player.create(participant_id: c_kampe.id, finishing_place: 5, game_id: game_5.id, additional_expense: 0)
# Player.create(participant_id: m_miranda.id, finishing_place: 6, game_id: game_5.id, additional_expense: 0)
# Player.create(participant_id: t_merry.id, finishing_place: 7, game_id: game_5.id, additional_expense: 0)

# 6
game_6 = Game.create(date: Date.new(2016, 4, 5), buy_in: 15, completed: true, season_id: season.id, attendees: 7)
Player.create(participant_id: a_baum.id, finishing_place: 1, game_id: game_6.id, additional_expense: 0)
Player.create(participant_id: j_mann.id, finishing_place: 2, game_id: game_6.id, additional_expense: 0)
Player.create(participant_id: s_lyndon.id, finishing_place: 3, game_id: game_6.id, additional_expense: 0)
# Player.create(participant_id: z_moore.id, finishing_place: 4, game_id: game_6.id, additional_expense: 0)
# Player.create(participant_id: t_merry.id, finishing_place: 5, game_id: game_6.id, additional_expense: 0)
# Player.create(participant_id: m_cassano.id, finishing_place: 6, game_id: game_6.id, additional_expense: 0)
# Player.create(participant_id: b_yang.id, finishing_place: 7, game_id: game_6.id, additional_expense: 0)

# 7
game_7 = Game.create(date: Date.new(2016, 5, 11), buy_in: 15, completed: true, season_id: season.id, attendees: 8)
Player.create(participant_id: c_kampe.id, finishing_place: 1, game_id: game_7.id, additional_expense: 0)
Player.create(participant_id: e_starling.id, finishing_place: 2, game_id: game_7.id, additional_expense: 0)
Player.create(participant_id: m_green.id, finishing_place: 3, game_id: game_7.id, additional_expense: 0)
# Player.create(participant_id: m_miranda.id, finishing_place: 4, game_id: game_7.id, additional_expense: 0)
# Player.create(participant_id: a_schindler.id, finishing_place: 5, game_id: game_7.id, additional_expense: 0)
# Player.create(participant_id: h_desroches.id, finishing_place: 6, game_id: game_7.id, additional_expense: 0)
# Player.create(participant_id: m_cassano.id, finishing_place: 7, game_id: game_7.id, additional_expense: 0)
# Player.create(participant_id: t_merry.id, finishing_place: 8, game_id: game_7.id, additional_expense: 0)

# 8
game_8 = Game.create(date: Date.new(2016, 6, 13), buy_in: 15, completed: true, season_id: season.id, attendees: 8)
Player.create(participant_id: t_merry.id, finishing_place: 1, game_id: game_8.id, additional_expense: 0)
Player.create(participant_id: m_cassano.id, finishing_place: 2, game_id: game_8.id, additional_expense: 0)
Player.create(participant_id: c_kampe.id, finishing_place: 3, game_id: game_8.id, additional_expense: 0)
# Player.create(participant_id: m_green.id, finishing_place: 4, game_id: game_8.id, additional_expense: 0)
# Player.create(participant_id: a_schindler.id, finishing_place: 5, game_id: game_8.id, additional_expense: 0)
# Player.create(participant_id: a_baum.id, finishing_place: 6, game_id: game_8.id, additional_expense: 0)
# Player.create(participant_id: h_desroches.id, finishing_place: 7, game_id: game_8.id, additional_expense: 0)
# Player.create(participant_id: r_gavrilov.id, finishing_place: 8, game_id: game_8.id, additional_expense: 0)

# 9
game_9 = Game.create(date: Date.new(2016, 7, 13), buy_in: 15, completed: true, season_id: season.id, attendees: 6)
Player.create(participant_id: m_cassano.id, finishing_place: 1, game_id: game_9.id, additional_expense: 0)
Player.create(participant_id: t_merry.id, finishing_place: 2, game_id: game_9.id, additional_expense: 0)
Player.create(participant_id: j_mortenson.id, finishing_place: 3, game_id: game_9.id, additional_expense: 0)
# Player.create(participant_id: a_baum.id, finishing_place: 4, game_id: game_9.id, additional_expense: 0)
# Player.create(participant_id: e_starling.id, finishing_place: 5, game_id: game_9.id, additional_expense: 0)
# Player.create(participant_id: j_mann.id, finishing_place: 6, game_id: game_9.id, additional_expense: 0)

# 10
game_10 = Game.create(date: Date.new(2016, 8, 16), buy_in: 15, completed: true, season_id: season.id, attendees: 7)
Player.create(participant_id: c_kampe.id, finishing_place: 1, game_id: game_10.id, additional_expense: 0)
Player.create(participant_id: a_baum.id, finishing_place: 2, game_id: game_10.id, additional_expense: 0)
Player.create(participant_id: m_green.id, finishing_place: 3, game_id: game_10.id, additional_expense: 0)
# Player.create(participant_id: m_miranda.id, finishing_place: 4, game_id: game_10.id, additional_expense: 0)
# Player.create(participant_id: t_merry.id, finishing_place: 5, game_id: game_10.id, additional_expense: 0)
# Player.create(participant_id: m_cassano.id, finishing_place: 6, game_id: game_10.id, additional_expense: 0)
# Player.create(participant_id: s_lukes.id, finishing_place: 7, game_id: game_10.id, additional_expense: 0)

# 11
game_11 = Game.create(date: Date.new(2016, 9, 21), buy_in: 15, completed: true, season_id: season.id, attendees: 7)
Player.create(participant_id: m_cassano.id, finishing_place: 1, game_id: game_11.id, additional_expense: 0)
Player.create(participant_id: m_miranda.id, finishing_place: 2, game_id: game_11.id, additional_expense: 0)
Player.create(participant_id: c_kampe.id, finishing_place: 3, game_id: game_11.id, additional_expense: 0)
# Player.create(participant_id: t_merry.id, finishing_place: 4, game_id: game_11.id, additional_expense: 0)
# Player.create(participant_id: a_baum.id, finishing_place: 5, game_id: game_11.id, additional_expense: 0)
# Player.create(participant_id: m_harris.id, finishing_place: 6, game_id: game_11.id, additional_expense: 0)
# Player.create(participant_id: j_mann.id, finishing_place: 7, game_id: game_11.id, additional_expense: 0)

# 12
game_12 = Game.create(date: Date.new(2016, 10, 18), buy_in: 15, completed: true, season_id: season.id, attendees: 6)
Player.create(participant_id: t_merry.id, finishing_place: 1, game_id: game_12.id, additional_expense: 0)
Player.create(participant_id: m_cassano.id, finishing_place: 2, game_id: game_12.id, additional_expense: 0)
Player.create(participant_id: m_miranda.id, finishing_place: 3, game_id: game_12.id, additional_expense: 0)
# Player.create(participant_id: a_baum.id, finishing_place: 4, game_id: game_12.id, additional_expense: 0)
# Player.create(participant_id: c_kampe.id, finishing_place: 5, game_id: game_12.id, additional_expense: 0)
# Player.create(participant_id: s_lukes.id, finishing_place: 6, game_id: game_12.id, additional_expense: 0)

# close & new season
season.update(active: false)
season2 = league.seasons.create

# 13
game_13 = Game.create(date: Date.new(2016, 11, 15), buy_in: 15, completed: true, season_id: season2.id, attendees: 9)
Player.create(participant_id: a_baum.id, finishing_place: 1, game_id: game_13.id, additional_expense: 0)
Player.create(participant_id: j_balu.id, finishing_place: 2, game_id: game_13.id, additional_expense: 0)
Player.create(participant_id: j_mann.id, finishing_place: 3, game_id: game_13.id, additional_expense: 0)
Player.create(participant_id: m_cassano.id, finishing_place: 4, game_id: game_13.id, additional_expense: 15)
Player.create(participant_id: m_harris.id, finishing_place: 5, game_id: game_13.id, additional_expense: 0)
Player.create(participant_id: m_miranda.id, finishing_place: 6, game_id: game_13.id, additional_expense: 0)
Player.create(participant_id: t_merry.id, finishing_place: 7, game_id: game_13.id, additional_expense: 0)
Player.create(participant_id: j_bogdan.id, finishing_place: 8, game_id: game_13.id, additional_expense: 0)
Player.create(participant_id: s_lukes.id, finishing_place: 9, game_id: game_13.id, additional_expense: 0)

# 14
game_14 = Game.create(date: Date.new(2017, 1, 16), buy_in: 15, completed: true, season_id: season2.id, attendees: 8)
Player.create(participant_id: m_cassano.id, finishing_place: 1, game_id: game_14.id, additional_expense: 0)
Player.create(participant_id: m_miranda.id, finishing_place: 2, game_id: game_14.id, additional_expense: 0)
Player.create(participant_id: c_kampe.id, finishing_place: 3, game_id: game_14.id, additional_expense: 0)
Player.create(participant_id: a_baum.id, finishing_place: 4, game_id: game_14.id, additional_expense: 0)
Player.create(participant_id: t_merry.id, finishing_place: 5, game_id: game_14.id, additional_expense: 0)
Player.create(participant_id: s_lukes.id, finishing_place: 6, game_id: game_14.id, additional_expense: 0)
Player.create(participant_id: a_fullerton.id, finishing_place: 7, game_id: game_14.id, additional_expense: 0)
Player.create(participant_id: j_balu.id, finishing_place: 8, game_id: game_14.id, additional_expense: 0)

# 15
game_15 = Game.create(date: Date.new(2017, 2, 20), buy_in: 15, completed: true, season_id: season2.id, attendees: 11)
Player.create(participant_id: m_miranda.id, finishing_place: 1, game_id: game_15.id, additional_expense: 0)
Player.create(participant_id: m_cassano.id, finishing_place: 2, game_id: game_15.id, additional_expense: 0)
Player.create(participant_id: m_green.id, finishing_place: 3, game_id: game_15.id, additional_expense: 0)
Player.create(participant_id: a_schindler.id, finishing_place: 4, game_id: game_15.id, additional_expense: 0)
Player.create(participant_id: t_merry.id, finishing_place: 5, game_id: game_15.id, additional_expense: 0)
Player.create(participant_id: e_austin.id, finishing_place: 6, game_id: game_15.id, additional_expense: 0)
Player.create(participant_id: a_baum.id, finishing_place: 7, game_id: game_15.id, additional_expense: 0)
Player.create(participant_id: j_mann.id, finishing_place: 8, game_id: game_15.id, additional_expense: 0)
Player.create(participant_id: c_kampe.id, finishing_place: 9, game_id: game_15.id, additional_expense: 0)
Player.create(participant_id: b_iverson.id, finishing_place: 10, game_id: game_15.id, additional_expense: 15)
Player.create(participant_id: a_fullerton.id, finishing_place: 11, game_id: game_15.id, additional_expense: 0)

# 16
game_16 = Game.create(date: Date.new(2017, 3, 21), buy_in: 15, completed: true, season_id: season2.id, attendees: 9)
Player.create(participant_id: m_cassano.id, finishing_place: 1, game_id: game_16.id, additional_expense: 0)
Player.create(participant_id: m_miranda.id, finishing_place: 2, game_id: game_16.id, additional_expense: 0)
Player.create(participant_id: a_baum.id, finishing_place: 3, game_id: game_16.id, additional_expense: 0)
Player.create(participant_id: t_merry.id, finishing_place: 4, game_id: game_16.id, additional_expense: 0)
Player.create(participant_id: c_kampe.id, finishing_place: 5, game_id: game_16.id, additional_expense: 0)
Player.create(participant_id: m_green.id, finishing_place: 6, game_id: game_16.id, additional_expense: 0)
Player.create(participant_id: z_other.id, finishing_place: 7, game_id: game_16.id, additional_expense: 15)
Player.create(participant_id: j_mann.id, finishing_place: 8, game_id: game_16.id, additional_expense: 0)
Player.create(participant_id: j_balu.id, finishing_place: 9, game_id: game_16.id, additional_expense: 0)

# 17
game_17 = Game.create(date: Date.new(2017, 4, 18), buy_in: 15, completed: true, season_id: season2.id, attendees: 8)
Player.create(participant_id: c_kampe.id, finishing_place: 1, game_id: game_17.id, additional_expense: 0)
Player.create(participant_id: t_merry.id, finishing_place: 2, game_id: game_17.id, additional_expense: 0)
Player.create(participant_id: m_miranda.id, finishing_place: 3, game_id: game_17.id, additional_expense: 0)
Player.create(participant_id: a_baum.id, finishing_place: 4, game_id: game_17.id, additional_expense: 0)
Player.create(participant_id: m_cassano.id, finishing_place: 5, game_id: game_17.id, additional_expense: 0)
Player.create(participant_id: m_harris.id, finishing_place: 6, game_id: game_17.id, additional_expense: 0)
Player.create(participant_id: s_lukes.id, finishing_place: 7, game_id: game_17.id, additional_expense: 0)
Player.create(participant_id: j_balu.id, finishing_place: 8, game_id: game_17.id, additional_expense: 15)

# 18
game_18 = Game.create(date: Date.new(2017, 5, 23), buy_in: 15, completed: true, season_id: season2.id, attendees: 8)
Player.create(participant_id: a_baum.id, finishing_place: 1, game_id: game_18.id, additional_expense: 0)
Player.create(participant_id: t_merry.id, finishing_place: 2, game_id: game_18.id, additional_expense: 0)
Player.create(participant_id: m_cassano.id, finishing_place: 3, game_id: game_18.id, additional_expense: 15)
Player.create(participant_id: c_kampe.id, finishing_place: 4, game_id: game_18.id, additional_expense: 0)
Player.create(participant_id: j_balu.id, finishing_place: 5, game_id: game_18.id, additional_expense: 0)
Player.create(participant_id: j_mann.id, finishing_place: 6, game_id: game_18.id, additional_expense: 0)
Player.create(participant_id: m_miranda.id, finishing_place: 7, game_id: game_18.id, additional_expense: 0)
Player.create(participant_id: s_lukes.id, finishing_place: 8, game_id: game_18.id, additional_expense: 0)
