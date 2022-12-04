#!/usr/bin/env cwl-runner
baseCommand:
- sh
- process.sh
- /tmp/inputs.json
class: CommandLineTool
cwlVersion: v1.2
inputs: {}
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
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.maap-ci-stage-io.v7
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: _stdout.txt
