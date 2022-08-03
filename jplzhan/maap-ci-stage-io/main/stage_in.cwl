#!/usr/bin/env cwl-runner
baseCommand:
- python3
- stage_in.py
class: CommandLineTool
cwlVersion: v1.1
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.maap-ci-stage-io.main
inputs:
  input_path:
    inputBinding:
      position: 1
      shellQuote: false
      valueFrom: '"$(self)"

        '
    type: string
outputs:
  output_file:
    outputBinding:
      glob: $(outputs.stdout_of_stage_in_script)
    type: File
requirements:
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
