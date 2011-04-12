require "rubygems"
require "erubis"

#--------------------------------------------------------------------
# Process an .rhtml page
#--------------------------------------------------------------------
class Page

  attr_reader :name, :title, :body, :mdate, :root_path
  
  #------------------------------------------------------------------
  # initialize an instance of this class from a file name
  #------------------------------------------------------------------
  def initialize(file_name)
    
    # set the name property
    @name = file_name
    
    # get the title property
    File.open(file_name, "r") do | file |
      lines = file.readlines
      
      pattern = %r{.*\<\!\-\- title\:(.*)\-\-\>.*}
      title_line = lines.detect do | line |
        match = pattern.match(line)
      end
      
      raise "file does not contain a title: #{file_name}" unless title_line
      
      match = pattern.match(title_line)
      @title = match[1].strip
    end
    
    # get the file's content
    File.open(file_name, "r") do | file |
      @body = file.read 
    end
    
    # get the file's modification date
    @mdate = File.mtime(file_name)
    
    # get the file's path to root
    segments = file_name.split("/").length
    if (1 == segments) then
      @root_path = "."
    else
      @root_path = Array.new(segments-1,"..").join("/")
    end
      
  end

  #------------------------------------------------------------------
  # initialize an instance of this class from a file name
  #------------------------------------------------------------------
  def getBinding() 
    page_root_path = @root_path
    page_title     = @title
    page_body      = @body
    page_mdate     = @mdate
    time           = Time.now
    
    return binding
  end

  #------------------------------------------------------------------
  # 
  #------------------------------------------------------------------
  def applyTemplate(template_file_contents, page, out_file_name)
    
    eruby = Erubis::Eruby.new(template_file_contents)
    expanded = eruby.result(page.getBinding())
 
    puts "generating #{out_file_name}\n"
    
    File.open(out_file_name, "w") do | file |
      file.write(expanded)
    end
  end
  
end