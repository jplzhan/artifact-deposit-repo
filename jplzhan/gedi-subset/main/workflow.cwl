#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
class: Workflow
cwlVersion: v1.2
inputs:
  aoi:
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
  columns: string
  limit: int
  maappgt: string
  query: string
  stage_out:
    type:
    - fields:
        aws_access_key_id: string
        aws_secret_access_key: string
        aws_session_token: string
        region: string
        s3_url: string
      name: STAK
      type: record
    - fields:
        aws_config: Directory
        s3_url: string
      name: LTAK
      type: record
    - fields:
        s3_url: string
      name: IAM
      type: record
outputs: {}
steps:
  process:
    in:
      aoi: stage_in_aoi/output_file
      columns: columns
      limit: limit
      maappgt: maappgt
      query: query
    out:
    - output_nb
    - output_dir
    run: process.cwl
  stage_in_aoi:
    in:
      input_path: aoi
    out:
    - output_file
    run: stage_in.cwl
  stage_out:
    in:
      output_dir: process/output_dir
      output_nb: process/output_nb
      output_path: stage_out
    out: []
    run: stage_out.cwl
