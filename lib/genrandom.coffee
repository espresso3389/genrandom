crypto = require('crypto')
unitlen = 24

module.exports =

  activate: ->
      atom.commands.add 'atom-text-editor', 'genrandom:generate': => @generate()

  generate: ->
      editor = atom.workspace.getActiveTextEditor()
      if editor
          sels = editor.getSelectionsOrderedByBufferPosition()
          if !sels
              return
          crypto.pseudoRandomBytes unitlen * sels.length, (ex, rand) ->
              for sel,i in sels
                  sel.insertText(rand.toString('base64', unitlen*i,unitlen*(i+1)))
