#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: temp url to speed up debugging
inputs:
  input_file:
    inputBinding:
      position: 1
      prefix: --parameters
      shellQuote: 'false'
      valueFrom: input_file "$(self)"
    type: string
  max_spin_time:
    inputBinding:
      position: 3
      prefix: --parameters
      shellQuote: 'false'
      valueFrom: max_spin_time "$(self)"
    type: string
  min_spin_time:
    inputBinding:
      position: 2
      prefix: --parameters
      shellQuote: 'false'
      valueFrom: min_spin_time "$(self)"
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
