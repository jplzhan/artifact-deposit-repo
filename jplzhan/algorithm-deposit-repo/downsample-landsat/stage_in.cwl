#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: marjoluc/hello-world:stable
inputs:
  input_1:
    inputBinding:
      position: 1
      prefix: --parameters
      shellQuote: false
      valueFrom: 'input_1 "$(self)"

        '
    type: string
outputs:
  example_out:
    type: stdout
  output_nb_file:
    outputBinding:
      glob: output_nb.ipynb
    type: File
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
