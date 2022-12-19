#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
class: Workflow
cwlVersion: v1.2
inputs:
  cache_dir: Directory?
  cache_only:
    default: true
    type: boolean
  parameters:
    type:
      fields:
        aoi:
          type: &id001
          - fields:
              aws_access_key_id: string
              aws_secret_access_key: string
              aws_session_token: string?
              region_name: string?
              s3_url:
                type:
                - string
                - string[]
            name: S3
            type: record
          - fields:
              password: string
              url:
                type:
                - string
                - string[]
              username: string
            name: DAAC
            type: record
          - fields:
              collection_id: string
              granule_name: string
              maap_pgt: string
            name: MAAP
            type: record
          - fields:
              maap_pgt: string
              url:
                type:
                - string
                - string[]
            name: MAAP_HTTP
            type: record
          - fields:
              role_arn: string
              source_profile: string
            name: Role
            type: record
          - fields:
              path:
                type:
                - File
                - File[]
            name: Local
            type: record
          - fields:
              url:
                type:
                - string
                - string[]
            name: HTTP
            type: record
          - fields:
              s3_url:
                type:
                - string
                - string[]
            name: S3_unsigned
            type: record
        granules:
          type: *id001
      name: parameters
      type: record
outputs: {}
requirements:
  StepInputExpressionRequirement: {}
steps:
  stage_in_aoi:
    in:
      cache_dir: cache_dir
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.aoi)
    out:
    - cache_out
    - output_files
    run: stage_in.cwl
  stage_in_granules:
    in:
      cache_dir: stage_in_aoi/cache_out
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.granules)
    out:
    - cache_out
    - output_files
    run: stage_in.cwl
