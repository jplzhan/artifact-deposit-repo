#!/usr/bin/env cwl-runner
baseCommand:
- python3
- /home/jovyan/stage_in.py
- /tmp/inputs.json
class: CommandLineTool
cwlVersion: v1.2
inputs:
  cache_dir: Directory?
  cache_only: boolean?
  input_path:
    type:
    - fields:
        aws_access_key_id: string
        aws_secret_access_key: string
        aws_session_token: string?
        region: string?
        s3_url:
          type:
          - string
          - string[]
      type: record
    - fields:
        password: string
        url:
          type:
          - string
          - string[]
        username: string
      type: record
    - fields:
        collection_id: string
        granule_name: string
      type: record
    - fields:
        role_arn: string
        source_profile: string
      type: record
    - fields:
        path:
          type:
          - File
          - File[]
      type: record
    - fields:
        url:
          type:
          - string
          - string[]
      type: record
    - fields:
        s3_url:
          type:
          - string
          - string[]
      type: record
outputs:
  output_file:
    outputBinding:
      glob: inputs/*/*
    type: File[]
  stdout_txt:
    type: stdout
requirements:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.maap-ci-stage-io.v8
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
