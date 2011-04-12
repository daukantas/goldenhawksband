#--------------------------------------------------------------------
# Rakefile with operations on web site
#--------------------------------------------------------------------

require 'time'
require 'rake/clean'
require 'plugins/page'

CLEAN.include("**/*.html")

#--------------------------------------------------------------------
# lists of .rhtml and .html files
#--------------------------------------------------------------------
RHTML = FileList["**/*.rhtml"].exclude("page_template.rhtml")
HTML  = RHTML.ext(".html")

#--------------------------------------------------------------------
# default task
#--------------------------------------------------------------------
#task :default => ["builton.txt"] do
task :default => [:help] do
end

#--------------------------------------------------------------------
# get page template
#--------------------------------------------------------------------
template_file_contents = ""
File.open("page_template.rhtml", "r") do | file |
  template_file_contents = file.read
end

#--------------------------------------------------------------------
# convert an .rhtml file to an .html file
#--------------------------------------------------------------------
rule '.html' => ['.rhtml', 'page_template.rhtml'] do | taskObject |
#  print "#{taskObject.name}: #{taskObject.source}\n" 
  page = Page.new("#{taskObject.source}")
  page.applyTemplate(template_file_contents, page, "#{taskObject.name}")
  
end

#--------------------------------------------------------------------
# a task that depends on all the .html files
#--------------------------------------------------------------------
file "builton.txt" => HTML

#--------------------------------------------------------------------
# run rake continuously
#--------------------------------------------------------------------
task :build => ["builton.txt"] do | taskObject |
end

#--------------------------------------------------------------------
# run rake continuously
#--------------------------------------------------------------------
task :watch do | taskObject |
  sh "run-when-changed --match \"*.rhtml\" \"rake build\" ."
end

#--------------------------------------------------------------------
# update the site
#--------------------------------------------------------------------
task :updatesite do | taskObject |
  sh "sitecopy --update goldenhawksband"
end

#--------------------------------------------------------------------
# update the site
#--------------------------------------------------------------------
task :help do | taskObject |
  puts "help       - display this help"
  puts "watch      - run the default task continuously (rebuilt site files)"
  puts "updatesite - run sitecopy command to update the remote site"
end
