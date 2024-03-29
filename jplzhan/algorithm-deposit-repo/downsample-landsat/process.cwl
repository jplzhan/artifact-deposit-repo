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
    type: int
  min_spin_time:
    inputBinding:
      position: 1
      prefix: --parameters
      shellQuote: false
      valueFrom: min_spin_time "$(self)"
    type: int
outputs:
  image:
    outputBinding:
      glob: '"LC*.TIF"'
    type: File
  output_nb:
    outputBinding:
      glob: '"output_nb.ipynb"'
    type: File
  wildcard:
    outputBinding:
      glob: '"*_downsampled"'
    type: File
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
