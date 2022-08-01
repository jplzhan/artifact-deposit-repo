#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.gedi-subset.main
inputs:
  columns:
    inputBinding:
      position: 1
      prefix: --parameters
      shellQuote: false
      valueFrom: columns "$(self)"
    type: string
  limit:
    inputBinding:
      position: 3
      prefix: --parameters
      shellQuote: false
      valueFrom: limit "$(self)"
    type: int
  query:
    inputBinding:
      position: 2
      prefix: --parameters
      shellQuote: false
      valueFrom: query "$(self)"
    type: string
outputs: {}
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
