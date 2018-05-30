#!/usr/bin/env ruby

require "FileUtils"
TOP="/Users/kunolab/Sites/seminar/ronbun/2018/"
POST_DATA=TOP+"post_data"
SCHEDULE_PATH=TOP+"schedule.txt"
SCHEDULE_PATH_NO_DEL=TOP+".schedule.txt~"
HTML_PATH=TOP+"index.html"
PROG_PATH=TOP+"../../templ.rb"
SLIDE_DIR=TOP+"slide/"
PAPER_DIR=TOP+"paper/"

def get_content(fname,regstr)
   regexp = Regexp.escape(regstr)
   head_line=""
   content=[]
   count=0
   File.open(fname,'r') do |f|
      f.each_line do |line|
         if (line.match(regexp))
            if (count==0)
               head_line=line
            end
            count += 1
         end
         if (count>0)
            if (line.match(/^----/))
               break
            else
               content.push(line)
            end
         end
      end
   end
   [head_line,content]
end

def get_one_elem(fname,regstr)
   a=get_content(fname,regstr)
   #puts "regstr->#{regstr} a[1]->'#{a[1]}'"
   #puts "a[0] #{a[0]}"
   #puts "a[1][2] #{a[1][2]}"
   b=(a[1][2]!=nil)?a[1][2].chomp! : "";
   #[a[0],a[1][2].chomp!]
   [a[0],b]
end

def get_value_from_head_line(line, key)
   regexp = Regexp.new(key+"=\"(.*)\"")
   md = line.match(regexp)
   value=""
   if (md)
      value=md[1]
   end 
   value
end

def get_file_body(fname,head_line)
   #get_content(fname,head_line)[1][3..-2].join
   get_content(fname,head_line)[1][3..-1].join
   # if last line is ^M then [3..-2], but if not, [3..-1] is correct
end

def write_slide(fname,head_line,id,list,prefix_abs,prefix_rel)
   saved_fname = get_value_from_head_line(head_line,"filename")
   if (saved_fname!='')
      path=prefix_abs+saved_fname
      #puts "path->#{path} head_line->#{head_line}"
      File.open(path,'w') do |f|
         f.write(get_file_body(fname,head_line))
      end

      File.open(list,'a') do |f|
         f.puts(id.to_s+" == "+prefix_rel+saved_fname)
      end
   end
end

def write_material(fname, head_line_paper, head_line_slide, id, output_list)
   saved_fname = get_value_from_head_line(head_line,"filename")
   if (saved_fname!='')
      path_paper=PAPER_DIR+saved_fname
      path_slide=SLIDE_DIR+saved_fname
      File.open(path,'w') do |f|
         f.write(get_file_body(fname,head_line))
      end

      File.open(output_list,'a') do |f|
         f.puts(id.to_s+" == "+prefix_rel+saved_fname)
      end
   end
end

def write_ronbun_schedule(fname)
   
   n = get_one_elem(fname,"stats")[1].to_i
   File.open(SCHEDULE_PATH,'w') do |f0|
      n.times do |i|
         id=i+1
         s1= "e1_" + id.to_s
         s2= "e2_" + id.to_s
         s3= "e3_" + id.to_s
         s4= "e4_" + id.to_s
         s5= "e5_" + id.to_s
         e1 = get_one_elem(fname,s1)
         e2 = get_one_elem(fname,s2)
         e3 = get_one_elem(fname,s3)
         e4 = get_one_elem(fname,s4)
         e5 = get_one_elem(fname,s5)	 
	 
	 paper=get_value_from_head_line(e4[0],"filename")
	 slide=get_value_from_head_line(e5[0],"filename")

	 hash={}
	 if( File.exist?(SCHEDULE_PATH_NO_DEL) )
	    File.open(SCHEDULE_PATH_NO_DEL,'r') do |f|
	         f.each_line do |line|
	           line.chomp!
	           a1,a2,a3,a4,a5,a6 = line.split(/\s*==\s*/)
	    
                   if ( a1.eql?id.to_s ) 
                      hash["1"] = a1
                      hash["2"] = a2
                      hash["3"] = a3
                      hash["4"] = a4
                      hash["5"] = a5
                      hash["6"] = a6
	    	end
	        end
	    end
	    
	    if ( paper=="" && hash["5"]!=nil )
	       paper = hash["5"]
	    end
	    if ( slide=="" && hash["6"]!=nil )
	       slide = hash["6"]
	    end
         end
         format=id.to_s+" == "+
            e1[1] + " == "+
            e2[1] + " == "+
            e3[1] + " == "+
            paper + " == "+
            slide + " == \n";
         f0.write(format)
      end
   end
   FileUtils.copy( SCHEDULE_PATH, SCHEDULE_PATH_NO_DEL ) ;
end

def update_html(fname,type)
   cmd="cd #{TOP}; #{PROG_PATH}"+ " " + type
   html=`#{cmd}`
   File.open(fname,'w') do |f|
      f.write(html)
   end
end

def write_data(fin,fout)
   File.open(fout,'w') do |f|
      while line = fin.gets
         f.write(line)
      end
   end
end

write_data(STDIN,POST_DATA)
write_ronbun_schedule(POST_DATA)
update_html(HTML_PATH,"ronbun_2018")

puts "Location: http://133.1.141.121/~kunolab/seminar/ronbun/2018/index.html"
puts ""
puts ""
