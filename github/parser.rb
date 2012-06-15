
#
# Parser/Printer for github POST payload
#
class GHPayload
  def initialize(payload)
    @project = payload['repository']['name']
    @commits = payload['commits']
  end

  def get_project
    @project
  end

  def get_commits
   @commits 
  end

  def print
    return  "Howdy mates!\n\n" + 
            "A push just arrived #{@project}'s mothership!\n" + 
            "Have some details:\n\n" + 
            @commits.map {|commit| commit['message'].to_s + " by " + commit['author']['name'] + " - " + commit['url']  + "\n"}.join(" ")
  end
end
