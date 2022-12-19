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
        region_name: string?
        s3_url:
          type:
          - string
          - string[]
      inputBinding:
        valueFrom: S3
      name: S3
      type: record
    - fields:
        password: string
        url:
          type:
          - string
          - string[]
        username: string
      inputBinding:
        valueFrom: DAAC
      name: DAAC
      type: record
    - fields:
        collection_id: string
        granule_name: string
        maap_pgt: string
      inputBinding:
        valueFrom: MAAP
      name: MAAP
      type: record
    - fields:
        maap_pgt: string
        url:
          type:
          - string
          - string[]
      inputBinding:
        valueFrom: MAAP_HTTP
      name: MAAP_HTTP
      type: record
    - fields:
        role_arn: string
        source_profile: string
      inputBinding:
        valueFrom: Role
      name: Role
      type: record
    - fields:
        path:
          type:
          - File
          - File[]
      inputBinding:
        valueFrom: Local
      name: Local
      type: record
    - fields:
        url:
          type:
          - string
          - string[]
      inputBinding:
        valueFrom: HTTP
      name: HTTP
      type: record
    - fields:
        s3_url:
          type:
          - string
          - string[]
      inputBinding:
        valueFrom: S3_unsigned
      name: S3_unsigned
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
    dockerPull: jplzhan/ci-generated-images:jplzhan.maap-ci-stage-io.v9
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
    - entry: $(inputs.cache_dir)
      entryname: $(inputs.cache_dir.path)
      writable: true
  InplaceUpdateRequirement:
    inplaceUpdate: true
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
