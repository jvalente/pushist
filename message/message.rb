require 'erb'

class Message
  attr_accessor :project, :commits
  def initialize(template, data)
    @template = template || "default"
    @project = data.project
    @commits = data.commits

    @content = ERB.new(File.read("./templates/#{@template}.txt.erb"), 0, '<>')
  end

  def print
   @content.result(binding) 
  end
end
