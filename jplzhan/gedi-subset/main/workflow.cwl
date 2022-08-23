#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
class: Workflow
cwlVersion: v1.1
hints:
  cwltool:Secrets:
    secrets:
    - workflow_aws_access_key_id
    - workflow_aws_secret_access_key
inputs:
  aoi:
    type:
    - fields:
        url: string
      name: HTTP
      type: record
    - fields:
        s3_url: string
      name: S3_unsigned
      type: record
    - fields:
        aws_access_key_id: string
        aws_secret_access_key: string
        aws_session_token: string
        region: string
        s3_url: string
      name: S3
      type: record
    - fields:
        password: string
        url: string
        username: string
      name: DAAC
      type: record
    - fields:
        collection_id: string
        granule_name: string
      name: MAAP
      type: record
    - fields:
        role_arn: string
        source_profile: string
      name: Role
      type: record
  columns: string
  limit: int
  maappgt: string
  query: string
  workflow_aws_access_key_id: string
  workflow_aws_secret_access_key: string
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
    run: process.cwl
  stage_in_aoi:
    in:
      input_path: aoi
    out:
    - output_file
    run: stage_in.cwl
  stage_out:
    in:
      aws_access_key_id: workflow_aws_access_key_id
      aws_secret_access_key: workflow_aws_secret_access_key
      output_nb: process/output_nb
    out: []
    run: stage_out.cwl
