class IndexController < ApplicationController
  def index
    # Hash: url -> text
    sheets = { 'event_sheet' =>'イベント発生管理' }
    master = { 'event_list'=>'イベントマスタ管理',
               'pidol'=>'プロデュースアイドル管理',
               'sidol'=>'サポートアイドル管理', }

    # page header
    page = String.new;
    page += '<!DOCTYPE html>'
    page += '<html lang="jp">'
    page += '<head>'
    page += '<meta charset="utf-8">'
    page += '<title>はづきのシャイニーノート</title>'
    page += '</head>'

    # page body
    page += '<body>'
    page += '<h1>はづきのシャイニーノート</h1>'
    page += '<p>プロデューサーさん用</p>'
    page += '<ul>'
    sheets.each_pair {|name, title|
      page += '<li><a href="' + name + '">' + title + '</a></li>'
    }
    page += '</ul>'
    page += '<p>はづき用</p>'
    page += '<ul>'
    master.each_pair {|name, title|
      page += '<li><a href="' + name + '">' + title + '</a></li>'
    }
    page += '</ul>'
    page += '</body>'

    # page footer
    page += '</html>'

    render html: page.html_safe
  end
end
