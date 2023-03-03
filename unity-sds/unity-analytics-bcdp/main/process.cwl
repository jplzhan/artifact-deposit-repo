#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
- -f
- /tmp/inputs.json
class: CommandLineTool
cwlVersion: v1.2
inputs:
  variable: string
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
    dockerPull: jplzhan/ci-generated-images:unity-sds.unity-analytics-bcdp.main
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
  InplaceUpdateRequirement:
    inplaceUpdate: true
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: _stdout.txt
