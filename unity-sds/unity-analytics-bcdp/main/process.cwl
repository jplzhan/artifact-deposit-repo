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
  variable:
    inputBinding:
      position: 1
      prefix: --parameters
      shellQuote: false
      valueFrom: variable "$(self)"
    type: string
outputs:
  CORDEX_Africa_clt_nc:
    outputBinding:
      glob: CORDEX_Africa_clt.nc
    type: File
  cordex_africa_png:
    outputBinding:
      glob: cordex_africa.png
    type: File
  output_nb_ipynb:
    outputBinding:
      glob: output_nb.ipynb
    type: File
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
