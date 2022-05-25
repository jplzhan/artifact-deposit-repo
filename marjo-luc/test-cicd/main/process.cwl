#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:marjo-luc.test-cicd.main
inputs:
  input_1:
    inputBinding:
      position: 1
      prefix: --parameters
      shellQuote: false
      valueFrom: input_1 "$(self)"
    type: string
outputs: {}
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
