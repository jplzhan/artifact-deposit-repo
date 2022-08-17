#!/usr/bin/env cwl-runner
baseCommand:
- python3
- /home/jovyan/stage_in.py
class: CommandLineTool
cwlVersion: v1.1
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.maap-ci-stage-io.v2
inputs:
  input_path:
    type:
    - fields:
        url:
          inputBinding:
            position: 1
            shellQuote: false
            valueFrom: HTTP "$(self)"
          type: string
      name: HTTP
      type: record
    - fields:
        s3_url:
          inputBinding:
            position: 1
            shellQuote: false
            valueFrom: S3_unsigned "$(self)"
          type: string
      name: S3_unsigned
      type: record
    - fields:
        aws_access_key_id:
          inputBinding:
            position: 2
            shellQuote: false
            valueFrom: $(self)
          type: string
        aws_secret_access_key:
          inputBinding:
            position: 3
            shellQuote: false
            valueFrom: $(self)
          type: string
        aws_session_token:
          inputBinding:
            position: 4
            shellQuote: false
            valueFrom: $(self)
          type: string
        region:
          inputBinding:
            position: 5
            shellQuote: false
            valueFrom: $(self)
          type: string
        s3_url:
          inputBinding:
            position: 1
            shellQuote: false
            valueFrom: S3 "$(self)"
          type: string
      name: S3
      type: record
    - fields:
        password:
          inputBinding:
            position: 3
            shellQuote: false
            valueFrom: $(self)
          type: string
        url:
          inputBinding:
            position: 1
            shellQuote: false
            valueFrom: DAAC "$(self)"
          type: string
        username:
          inputBinding:
            position: 2
            shellQuote: false
            valueFrom: $(self)
          type: string
      name: DAAC
      type: record
    - fields:
        collection_id:
          inputBinding:
            position: 1
            shellQuote: false
            valueFrom: MAAP "$(self)"
          type: string
        granule_name:
          inputBinding:
            position: 2
            shellQuote: false
            valueFrom: $(self)
          type: string
      name: MAAP
      type: record
    - fields:
        role_arn:
          inputBinding:
            position: 1
            shellQuote: false
            valueFrom: Role "$(self)"
          type: string
        source_profile:
          inputBinding:
            position: 2
            shellQuote: false
            valueFrom: $(self)
          type: string
      name: Role
      type: record
outputs:
  output_file:
    outputBinding:
      glob: inputs/*
    type: File
  stdout_txt:
    type: stdout
requirements:
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
