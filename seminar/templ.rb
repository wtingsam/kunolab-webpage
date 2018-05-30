#!/usr/bin/env ruby
# -*- encoding: mule-utf-8 -*-

load '../../templ_tool.rb'
load '../../templ_forms.rb'

class Html_maker
  # Initialize
  def initialize(cgi,
                 body_title,
                 eng=true,
                 schedule='schedule.txt',
                 page_title='Kuno Member Page',
                 css='default.css',
                 js='default.js'
                 )
    @eng = eng
    @schedule = schedule
    @page_title = page_title
    @css = css
    @js = js
    @cgi = cgi
    @body_title = body_title
  end

  # Define rules
  def rule
    body=<<-END
       <ul class="list_disc">
       <li>A paper should be in English.
       <li>You should choice a paper which is related to particle physics.
       <li>You should make slide in English.
       <li>Oral is acceptable in Japanese.
       <li>A presentation time is 30 minutes.
       <li>You must present on a fixed date.
       <li>If you can not present on a fixed date, you must negotiate someone to change the date.
       <li>If you can not present on a fixed date and you could not negotiate, your date will be the last date. But some one negotiate with you to change the date, you could not reject unless you have a reason.
       </ul>
END
  end

  # Define a header
  def _make_header(page_title,css,js)
    puts "<!-- This is the header -->"
    puts "<head>"
    puts "<meta charset='UTF-8'>"
    puts "<link rel=\"stylesheet\" href=\"//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css\" type=\"text/css\" />" if css
    puts "<link rel=\"stylesheet\" href=\"#{css}\" type=\"text/css\" />" if css
    puts "<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'></script>"
    puts "<script type=\"text/javascript\" src=\"#{js}\"></script>" if js
    puts "<title>#{page_title}</title>"
    puts "</head>"
    puts ""
  end

  # Define Menu bar
  def _make_menu_bar
    puts "<div id=\"b2\">"
    navi
    puts "</div>"
  end

  # Make the list
  def print
    # Read data
    all_data = read_data(@schedule)
    # Start making
    puts "<!DOCTYPE html>"
    puts "<html>"
    _make_header(@page_title,@css,@js)
    puts "<body>"
    # Menu
    _make_menu_bar
    puts "<div id=\"b1\">"
    # Form
    form_sam(@eng,@cgi,@body_title,all_data)
    puts "</div>"
    puts "<div id=\"result\"></div>"
    puts "<br><h3>Rule</h2>"
    puts "<div id=\"rule\">#{rule}</div>"
    puts "</body>"
    puts "</html>"
  end
end

CGI_DIR='../../../cgi-bin'

# List of htmls to be created
ronbun_2018_html = Html_maker.new("#{CGI_DIR}/ronbun_2018.cgi",'Paper Presentation')
kenkyu_2018_html = Html_maker.new("#{CGI_DIR}/kenkyu_2018.cgi",'Research Presentation')


# Mapping
func={
  "ronbun_2018"=>ronbun_2018_html,
  "kenkyu_2018"=>kenkyu_2018_html,
}

# main Function for running
func[ARGV[0]].print
