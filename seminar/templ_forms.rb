#!/usr/bin/env ruby
# -*- encoding: mule-utf-8 -*-

####################################
## Build a form for mini workshop
####################################

def form_workshop(cgi,title,timetable, slides)
    puts "<form id=\"form1\" method=\"post\" action=\"#{cgi}\" enctype=\"multipart/form-data\">"
    puts "<h2 id=\"Title\">#{title}</h2>"
    puts "<table id=\"table1\">"
    puts "<tr>"
    puts "<th>Time</th>"
    puts "<th></th>"
    puts "<th></th>"
    puts "<th>Presenter</th>"
    puts "<th>Title</th>"
    puts "<th>Slide</th>"
    puts "</tr>"
    timetable.each do |ent|
        id     = ent["1"]
        stime  = ent["2"]
        etime  = ent["3"]
        person = ent["4"]
        title  = ent["5"]
        slide  = slides[id]

        puts "<tr>"
        puts "<td>#{stime}</td>"
        puts "<td>-</td>"
        puts "<td>#{etime}</td>"
        puts "<td>#{person}</td>"
        puts "<td>#{title}</td>"
        puts (!slide)? "<td></td>":"<td><a href=\"#{slide}\">Slide</a></td>"
        puts "</tr>"
    end
    puts "</table>"
    puts "<div id=\"edit\"><input type=\"button\" value=\"edit\" onclick=\"edit2('table1')\"></div>"
    puts "<div id=\"editable\"></div>"
    puts "<div id=\"kosin\"></div>"
    puts "<input type=\"hidden\" name=\"stats\" id=\"stats\">"
    puts "</form>"
end

####################################
## Build a form for kenkyu?
####################################

def form4(eng,cgi,title,ents,slides)
    puts "<form id=\"form1\" method=\"post\" action=\"#{cgi}\" enctype=\"multipart/form-data\">"
    puts "<form id=\"form1\" method=\"post\" action=\"#{cgi}\" enctype=\"multipart/form-data\">"
    puts "<h2 id=\"Title\">#{title}</h2>"
    puts "<h3 id=\"TitleLink\">"
    puts "<a href=\"../2011/index.html\">2011</a>"
    puts "<a href=\"../2012/index.html\">2012</a>"
    puts "<a href=\"../2013/index.html\">2013</a>"
    puts "<a href=\"../2014/index.html\">2014</a></h3>"
    puts "<table id=\"table1\">"
    puts "<tr>"
    puts (eng)? "<th>Date</th>"  : "<th>日付</th>"
    puts (eng)? "<th>Person</th>": "<th>発表者</th>"
    puts (eng)? "<th>Title</th>" : "<th>発表タイトル</th>"
    puts (eng)? "<th>Upload</th>": "<th>スライド</th>"
    puts "</tr>"
    ents.each do |ent|

        id     = ent["1"]
        date   = ent["2"]
        title  = ent["4"]
        person = ent["3"]
        slide  = slides[id]

        puts "<tr>"
        puts "<td>#{date}</td>"
        puts "<td>#{person}</td>"
        puts "<td>#{title}</td>"
        puts (!slide)? "<td></td>":"<td><a href=\"#{slide}\">スライド</a></td>"
        #puts "<td><input type=\"file\" name=\"#{id}\"> </input><input type=\"submit\" value=\"Upload\" onclick=\"return mysubmit(1);\"></input></td>"
        puts "</tr>"
    end
    puts "</table>"
    if (!eng)
        puts "<div id=\"edit\"><input type=\"button\" value=\"編集\" onclick=\"edit('table1')\"></div>"
    else
        puts "<div id=\"edit\"><input type=\"button\" value=\"edit\" onclick=\"edit('table1')\"></div>"
    end
    puts "<div id=\"editable\"></div>"
    puts "<div id=\"kosin\"></div>"
    puts "<input type=\"hidden\" name=\"stats\" id=\"stats\">"
    puts "</form>"
end

####################################
## Build a form for ronbun
####################################

def form33(eng,cgi,title,ents,slides,papers)
    puts "<form id=\"form1\" method=\"post\" action=\"#{cgi}\" enctype=\"multipart/form-data\">"
    puts "<h2 id=\"Title\">#{title}</h2>"
    puts "<h3 id=\"TitleLink\">"
    puts "<a href=\"/~sakamoto/kunolab/Ronbun2/2011/index.html\">2011</a>"
    puts "<a href=\"/~sakamoto/kunolab/Ronbun2/2012/index.html\">2012</a>"
    puts "<a href=\"/~sakamoto/kunolab/Ronbun2/2013/index.html\">2013</a>"
    puts "<a href=\"/~sakamoto/kunolab/Ronbun2/2014/index.html\">2014</a>"
    puts "<a href=\"/~sakamoto/kunolab/Ronbun2/2015/index.html\">2015</a>"
    puts "<a href=\"/~sakamoto/kunolab/Ronbun2/2016/index.html\">2016</a>"
    puts "<a href=\"/~sakamoto/kunolab/Ronbun2/2017/index.html\">2017</a></h3>"
    puts "<table id=\"table1\">"
    puts "<tr>"
    puts (eng)? "<th>Date</th>"  : "<th>日付</th>"
    puts (eng)? "<th>Person</th>": "<th>発表者</th>"
    puts (eng)? "<th>Title</th>" : "<th>タイトル</th>"
    puts (eng)? "<th>Paper</th>" : "<th>論文</th>"
    puts (eng)? "<th>Slide</th>" : "<th>スライド</th>"
    puts "</tr>"
    ents.each do |ent|

        id     = ent["1"]
        date   = ent["2"]
        title  = ent["4"]
        person = ent["3"]
        paper  = papers[id]
        slide  = slides[id]

        puts "<tr>"
        puts "<td>#{date}</td>"
        puts "<td>#{person}</td>";
        puts "<td>#{title}</td>";
        #puts "<td></td>";
        #puts "<td></td>";
        puts (!paper)? "<td></td>":"<td><a href=\"#{paper}\">論文</a></td>"
        puts (!slide)? "<td></td>":"<td><a href=\"#{slide}\">スライド</a></td>"
        #puts "<td><input type=\"file\" name=\"#{id}\"> </input><input type=\"submit\" value=\"Upload\" onclick=\"return mysubmit(1);\"></input></td>"
        puts "</tr>"
    end
    puts "</table>"
    puts "<div id=\"edit\"><input type=\"button\" value=\"編集\" onclick=\"edit('table1')\"></div>"
    puts "<div id=\"editable\"></div>"
    puts "<div id=\"kosin\"></div>"
    puts "<input type=\"hidden\" name=\"stats\" id=\"stats\">"
    puts "</form>"
end

####################################
## Build a form for kenkyu? 
####################################

def form3(eng,cgi,title,ents,slides,papers)
    puts "<form id=\"form1\" method=\"post\" action=\"#{cgi}\" enctype=\"multipart/form-data\">"
    puts "<h2 id=\"Title\">#{title}</h2>"
    puts "<table id=\"table1\" style=\"width:100%\">"
    puts "<tr>"
    puts (eng)? "<th>Date</th>"  : "<th>日付</th>"
    puts (eng)? "<th>Name</th>": "<th>発表者</th>"
    puts (eng)? "<th>Title</th>" : "<th>タイトル</th>"
    puts (eng)? "<th>Paper</th>" : "<th>論文</th>"
    puts (eng)? "<th>Slide</th>" : "<th>スライド</th>"
    puts "</tr>"

    # Loop over the entry
    ents.each do |ent|
        id     = ent["1"]
        date   = ent["2"]
        title  = ent["4"]
        person = ent["3"]
        paper  = papers[id]
        slide  = slides[id]
	paper_name  = paper[6..-1]
	slide_name  = slide[6..-1]

        puts "<tr>"
        puts "<td>#{date}</td>"
        puts "<td>#{person}</td>";
        puts "<td>#{title}</td>";
        puts (!paper)? "<td>\"empty\"</td>":"<td><a href=\"#{paper}\">#{paper_name}</a></td>"
        puts (!slide)? "<td>\"empty\"</td>":"<td><a href=\"#{slide}\">#{slide_name}</a></td>"
        puts "</tr>"
    end
    puts "</table>"
    puts "<div id=\"edit\"><input type=\"button\" value=\"Update\" onclick=\"edit('table1')\"></div>"
    puts "<div id=\"editable\"></div>"
    puts "<div id=\"kosin\"></div>"
    puts "<input type=\"hidden\" name=\"stats\" id=\"stats\">"
    puts "</form>"
end


####################################
## Build a form for kenkyu?
####################################
def form_sam(eng,cgi,body_title,ents)
    # Puts tables
    puts "<form id=\"form1\" method=\"post\" action=\"#{cgi}\" enctype=\"multipart/form-data\">"
    puts "<h2 id=\"Title\">#{body_title}</h2>"
    puts "<table id=\"table1\" class=\"table-editable\" style=\"width:100%\">"
    puts "<tr>"
    puts (eng)? "<th >Date</th>"  : "<th>日付</th>"
    puts (eng)? "<th >Name</th>"  : "<th>発表者</th>"
    puts (eng)? "<th >Title</th>" : "<th>タイトル</th>"
    puts (eng)? "<th >Paper</th>" : "<th>論文</th>"
    puts (eng)? "<th >Slide</th>" : "<th>スライド</th>"
    puts "</tr>"
    ents.each do |ent|
        id     = ent["1"]
        date   = ent["2"]
        person = ent["3"]
        title  = ent["4"]
        paper  = ent["5"]
        slide  = ent["6"]
        path_paper = "papers/" + "#{paper}"
        path_slide = "slides/" + "#{slide}"
        puts "<tr>"
        puts "<td>#{date}</td>"
        puts "<td>#{person}</td>";
        puts "<td>#{title}</td>";
        puts (!path_paper)? "<td></td>":"<td><a href=\"#{path_paper}\">#{paper}</a></td>"
        puts (!path_slide)? "<td></td>":"<td><a href=\"#{path_slide}\">#{slide}</a></td>"
        puts "</tr>"
    end
    puts "</table>"
    puts "<div id=\"edit\"><input type=\"button\" value=\"Update\" onclick=\"edit('table1')\"></div>"
    puts "<div id=\"editable\"></div>"
    puts "<div id=\"kosin\"></div>"
    puts "<input type=\"hidden\" name=\"stats\" id=\"stats\">"
    puts "</form>"
end

####################################
## Build a form for kenkyu? 
####################################

def form2(eng,cgi,title,ents,slides)
    puts "<form id=\"form1\" method=\"post\" action=\"#{cgi}\" enctype=\"multipart/form-data\">"
    puts "<h2 id=\"Title\">#{title}</h2>"
    puts "<table id=\"table1\">"
    puts "<tr>"
    puts (eng)? "<th>Date</th>"  : "<th>日付</th>"
    puts (eng)? "<th>Person</th>": "<th>発表者</th>"
    puts (eng)? "<th>Title</th>" : "<th>発表タイトル</th>"
    puts (eng)? "<th>Upload</th>": "<th>スライド</th>"
    puts "</tr>"
    ents.each do |ent|

        id     = ent["1"]
        date   = ent["2"]
        title  = ent["4"]
        person = ent["3"]
        slide  = slides[id]

        puts "<tr>"
        puts "<td>#{date}</td>"
        puts "<td>#{person}</td>"
        puts "<td>#{title}</td>"
        puts (!slide)? "<td></td>":"<td><a href=\"#{slide}\">スライド</a></td>"
        #puts "<td><input type=\"file\" name=\"#{id}\"> </input><input type=\"submit\" value=\"Upload\" onclick=\"return mysubmit(1);\"></input></td>"
        puts "</tr>"
    end
    puts "</table>"
    if (!eng)
        puts "<div id=\"edit\"><input type=\"button\" value=\"編集\" onclick=\"edit('table1')\"></div>"
    else
        puts "<div id=\"edit\"><input type=\"button\" value=\"edit\" onclick=\"edit('table1')\"></div>"
    end
    puts "<div id=\"editable\"></div>"
    puts "<div id=\"kosin\"></div>"
    puts "<input type=\"hidden\" name=\"stats\" id=\"stats\">"
    puts "</form>"
end

####################################
## Build a form for HtmlSemi
####################################

def form(eng,cgi,title,image,index,ents,slides,pdf)
    puts "<form id=\"form1\" method=\"post\" action=\"#{cgi}\" enctype=\"multipart/form-data\">"
    puts "<h2 id=\"Title\">#{title}</h2>"
    puts "<img src=\"#{image}\" width=\"150\" class=\"bookImg\"></img>"
    puts (eng)? "<a href=\"#{index}\">Index</a>":"<a href=\"#{index}\">目次</a>"
    puts (eng)? "<a href=\"#{pdf}\">PDF</a>":"<a href=\"#{pdf}\">PDF</a>" if pdf!=''
    puts "<p>"
    puts "<table id=\"table2\">"
    puts "<tr>"
    puts (eng)? "<th>Date</th>":"<th>日付</th>"
    puts (eng)? "<th>Section</th>":"<th>節</th>"
    puts (eng)? "<th>Person</th>":"<th>担当</th>"
    puts (eng)? "<th>Slide</th>":"<th>スライド</th>"
    puts "</tr>"
    ents.each do |ent|

        id     = ent["1"]
        date   = ent["2"]
        title  = ent["3"]
        person = ent["4"]
        slide  = slides[id]

        puts "<tr>"
        puts "<td>#{date}</td>"
        puts "<td>#{title}</td>"
        puts "<td>#{person}</td>"
        puts (!slide)? "<td></td>":"<td><a href=\"#{slide}\">スライド</a></td>" if (!eng)
        puts (!slide)? "<td></td>":"<td><a href=\"#{slide}\">Slide</a></td>" if (eng)
        #puts (!slide)? "<td></td>":"<td><a href=\"#{slide}\">スライド</a></td>"
        #puts (!slide)?" <td></td>":"<td><a href=\"#{slide}\">Slide</a></td>"
        #puts "<td><input type=\"file\" name=\"#{id}\"> </input><input type=\"submit\" value=\"Upload\" onclick=\"return mysubmit(1);\"></input></td>"
        puts "</tr>"
    end
    puts "</table>"
    if (!eng)
        puts "<div id=\"edit\"><input type=\"button\" value=\"編集\" onclick=\"edit('table2')\"></div>"
    else
        puts "<div id=\"edit\"><input type=\"button\" value=\"edit\" onclick=\"edit('table2')\"></div>"
    end
    puts "<div id=\"editable\"></div>"
    puts "<div id=\"kosin\"></div>"
    puts "<input type=\"hidden\" name=\"stats\" id=\"stats\">"
    puts "</p>"
    puts "</form>"
end

