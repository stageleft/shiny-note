# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# illumination STARS
Idol.create(name: '風野 灯織')
Idol.create(name: '櫻木 真乃')
Idol.create(name: '八宮 めぐる')
# L'Antica
Idol.create(name: '田中 摩美々')
Idol.create(name: '幽谷 霧子')
Idol.create(name: '月岡 恋鐘')
Idol.create(name: '三峰 結華')
Idol.create(name: '白瀬 咲耶')
# ALSTROMERIA
Idol.create(name: '大崎 甘奈')
Idol.create(name: '桑山 千雪')
Idol.create(name: '大崎 甜花')
# 放課後クライマックスガールズ
Idol.create(name: '杜野 凛世')
Idol.create(name: '園田 智代子')
Idol.create(name: '小宮 果穂')
Idol.create(name: '西城 樹里')
Idol.create(name: '有栖川 夏葉')

# debug
EventList.create(name: 'みえない献身', model: 'idol', modelid: 5)
Choice.create(name: 'じゃあ……俺にも掃除させてくれ',         Vo:  0, Da:  0, Vi: 20, Me: 5, Sp: 10, event: 1)
Choice.create(name: 'そういうところは、霧子の魅力だと思うぞ', Vo: 20, Da:  0, Vi:  0, Me: 5, Sp: 10, event: 1)
Choice.create(name: 'それは、霧子のためにもなるって思うぞ',   Vo:  0, Da: 20, Vi:  0, Me: 5, Sp: 10, event: 1)

Pidol.create(name: '伝・伝・心・音', modelid: 5)
EventList.create(name: 'どなたですか', model: 'pidol', modelid: 1)
Choice.create(name: '',   Vo: 20, Da:  0, Vi:  0, Me: 5, Sp: 10, event: 2)

