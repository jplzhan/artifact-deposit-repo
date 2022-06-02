#!/usr/bin/env cwl-runner
baseCommand:
- sh
- dps/alg_3-1-5/run.sh
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:lauraduncanson.icesat2_boreal.master
inputs: {}
outputs: {}
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
