#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.1
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:unity-sds.unity-analytics-bcdp.main
inputs:
  dataset_path:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: dataset_path "$(self)"
    type: string
  variable:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: variable "$(self)"
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
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: _stdout.txt
