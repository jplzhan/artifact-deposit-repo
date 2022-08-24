#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.1
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.gedi-subset.main
inputs:
  aoi:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: aoi "$(self.path)"
    type: File
  columns:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: columns "$(self)"
    type: string
  limit:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: limit "$(self)"
    type: int
  maappgt:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: maappgt "$(self)"
    type: string
  query:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: query "$(self)"
    type: string
outputs:
  output_dir:
    outputBinding:
      glob: output
    type: Directory
  output_nb:
    outputBinding:
      glob: output_nb.ipynb
    type: File
requirements:
  ShellCommandRequirement: {}
  NetworkAccess:
    networkAccess: true
stdout: _stdout.txt
