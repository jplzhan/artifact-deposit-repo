#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: docker://jplzhan/ci-generated-images:test-tag-12
inputs: {}
outputs:
  example_out:
    type: stdout
  output_nb_file:
    outputBinding:
      glob: output_nb.ipynb
    type: File
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
