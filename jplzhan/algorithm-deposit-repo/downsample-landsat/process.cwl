#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.algorithm-deposit-repo.downsample-landsat
inputs:
  max_spin_time:
    inputBinding:
      position: 2
      prefix: --parameters
      shellQuote: false
      valueFrom: max_spin_time "$(self)"
    type: float
  min_spin_time:
    inputBinding:
      position: 1
      prefix: --parameters
      shellQuote: false
      valueFrom: min_spin_time "$(self)"
    type: float
outputs:
  image:
    outputBinding:
      glob: image
    type: File
  output_nb:
    outputBinding:
      glob: output_nb
    type: File
  wildcard:
    outputBinding:
      glob: wildcard
    type: File
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
