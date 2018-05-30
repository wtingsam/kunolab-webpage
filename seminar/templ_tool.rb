#!/usr/bin/env ruby
# -*- encoding: mule-utf-8 -*-


####################################
## Define a navi for contecting to 
## sakamoto san's website
####################################

def navi(rel_pos="/~kunolab/")
    puts "<ul class='menuBar'>"
    puts "<li><a href=\"/~sakamoto/kunolab/MiniWorkshop/2nd/index.html\">Mini-Workshop</a>"
    puts "<li><a href=\"https://calendar.google.com/calendar/embed?src=kunogroup%40gmail.com&ctz=Asia%2FTokyo\">久野研カレンダー(KunoLabCalendar)</a>"
    puts "<li><a href=\"/~kunolab/seminar/ronbun/2018/index.html\">論文紹介(Paper Presentation)</a>"
    puts "<li><a href=\"/~kunolab/seminar/kenkyu/2018/index.html\">研究紹介(Research Presentation)</a>"
    puts "<li><a href='#'>ゼミ(Seminar) <image src=\"image/sita3.png\" class=\"headImg\"></a>"
    puts "<ul>"
    puts "<li><a href=\"/~kunolab/seminar/Lepton_2017/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Leptonゼミ(2017)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Modern_2016/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Thomsonゼミ(2016)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Modern_2015/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Thomsonゼミ(2015)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Perkins_2015/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Perkinsゼミ(2015)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Mann_2014/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Mannゼミ(2014)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Mann/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Mannゼミ(2013)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Elementary_2013/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> 素粒子物理学ゼミ(2013)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Leo_2012/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Leoゼミ(2012)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Perkins_2012/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Perkinsゼミ(2012)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Elementary/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> 素粒子物理学ゼミ(2012)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Knoll/index.html\">     <image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Knollゼミ(2011)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Knoll_en/index.html\">  <image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Knoll(en)ゼミ(2011)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Roe/index.html\">       <image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Roeゼミ(2011)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Leo/index.html\">       <image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Leoゼミ(2010)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Perkins_en/index.html\"><image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Perkins(en)ゼミ(2010)</a></li>"
    puts "<li><a href=\"/~sakamoto/kunolab/Leo_en/index.html\">    <image src=\"#{rel_pos}img/yoko3.png\" class=\"headImg\"> Leo(en)ゼミ(2010)</a></li>"
    puts "</ul>"
    puts "</ul>"
end

####################################
## A function to read slide path
####################################

def read_slide(fname)
    hash={}
    File.open(fname,'r') do |f|
        f.each_line do |line|
            line.chomp!
            a1,a2 = line.split(/\s*==\s*/)
            hash[a1] = a2 # a1:id, a2:path
        end
    end
    hash
end

## Read Data

####################################
## A function to read summary path
####################################
def read_summary(fname)
    hash={}
    # Read file
    File.open(fname,'r') do |f|
        # Loop over line
        f.each_line do |line|
            line.chomp!
            index,content = line.split(/\s*==\s*/)
            hash[index] = content # index:id, content:path
        end
    end
    return hash
end


#########################################
## A function to read data
## Arg:
##     fname: file name (text file)
## The format is like this
## id | name | title | reference | slide
#########################################


# Define Read data
def read_data(fname)
  ents=[]
  if ( File.exist?(fname) )
    File.open(fname,'r') do |f|
      f.each_line do |line|
        line.chomp!
        a1,a2,a3,a4,a5,a6 = line.split(/\s*==\s*/)
        hash={}
        hash["1"] = a1
        hash["2"] = a2
        hash["3"] = a3
        hash["4"] = a4
        hash["5"] = a5
        hash["6"] = a6
        ents.push(hash)
      end
    end
  end
  ents
end
####################################
## A function to read schedule .txt
####################################

def read_schedule2(fname)
    ents=[]
    File.open(fname,'r') do |f|
        f.each_line do |line|
            line.chomp!
            a1,a2,a3,a4 = line.split(/\s*==\s*/)
            hash={}
            hash["1"] = a1
            hash["2"] = a2
            hash["3"] = a3
            hash["4"] = a4
            ents.push(hash)
        end
    end
    ents
end

####################################
## A function to read time table 
####################################

def read_time_table(fname)
    ents=[]
    File.open(fname,'r') do |f|
        f.each_line do |line|
            line.chomp!
            a1,a2,a3,a4,a5 = line.split(/\s*==\s*/)
            hash={}
            hash["1"] = a1 # id
            hash["2"] = a2 # start time
            hash["3"] = a3 # end time
            hash["4"] = a4 # person
            hash["5"] = a5 # title
            ents.push(hash)
        end
    end
    ents
end

