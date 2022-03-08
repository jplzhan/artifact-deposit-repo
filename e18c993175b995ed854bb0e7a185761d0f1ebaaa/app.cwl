#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/app.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: <<<tempuser/temp-repo:stable>>>
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
