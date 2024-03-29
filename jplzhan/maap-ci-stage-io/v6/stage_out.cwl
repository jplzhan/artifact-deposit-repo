#!/usr/bin/env cwl-runner
baseCommand:
- python3
- /home/jovyan/stage_out.py
class: CommandLineTool
cwlVersion: v1.1
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.maap-ci-stage-io.v6
inputs:
  output_dir:
    inputBinding:
      position: 1
      shellQuote: false
      valueFrom: $(self.path)
    type: Directory
  output_nb:
    inputBinding:
      position: 2
      shellQuote: false
      valueFrom: $(self.path)
    type: File
  output_path:
    type:
    - fields:
        aws_access_key_id:
          inputBinding:
            position: 4
            shellQuote: false
            valueFrom: $(self)
          type: string
        aws_secret_access_key:
          inputBinding:
            position: 5
            shellQuote: false
            valueFrom: $(self)
          type: string
        aws_session_token:
          inputBinding:
            position: 6
            shellQuote: false
            valueFrom: $(self)
          type: string
        region:
          inputBinding:
            position: 7
            shellQuote: false
            valueFrom: $(self)
          type: string
        s3_url:
          inputBinding:
            position: 3
            shellQuote: false
            valueFrom: $(self)
          type: string
      name: STAK
      type: record
    - fields:
        aws_config:
          inputBinding:
            position: 4
            shellQuote: false
            valueFrom: $(self.path)
          type: Directory
        s3_url:
          inputBinding:
            position: 3
            shellQuote: false
            valueFrom: $(self)
          type: string
      name: LTAK
      type: record
outputs: {}
requirements:
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stderr: stage_out_stderr.txt
stdout: stage_out_stdout.txt
