#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.0
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
  output_nb:
    outputBinding:
      glob: output_nb.ipynb
    type: File
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
