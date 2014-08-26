linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"

class LinterSquirrel extends Linter
  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  @syntax: 'source.nut'

  # A string, list, tuple or callable that returns a string, list or tuple,
  # containing the command line (with arguments) used to lint.
  cmd: 'sq-compiler'

  linterName: 'squirrel'

  # A regex pattern used to extract information from the executable's output.
  regex:
    'Error in (.*) on line (?<line>\\d+) column (?<col>\\d+): (?<message>.+)'

  errorStream: 'stderr'

  constructor: (editor) ->
    super(editor)

    atom.config.observe 'linter-squirrel.squirrelCompilerExecutablePath', =>
            @executablePath = atom.config.get 'linter-squirrel.squirrelCompilerExecutablePath'

  destroy: ->
    atom.config.unobserve 'linter-squirrel.squirrelCompilerExecutablePath'

module.exports = LinterSquirrel
