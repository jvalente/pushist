
#
# Parser/Printer for github POST payload
#
class GHPayload
  attr_accessor :project, :commits
  def initialize(payload)
    @project = payload['repository']['name']
    @commits = payload['commits']
  end
end
