#!/usr/bin/env cwl-runner
baseCommand:
- sh
- process.sh
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.maap-ci-stage-io.v2
inputs: {}
outputs:
  output_nb:
    outputBinding:
      glob: output_nb.ipynb
    type: File
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
