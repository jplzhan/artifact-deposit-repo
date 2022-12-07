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
        boreal_vect:
          type: &id001
          - fields:
              aws_access_key_id: string
              aws_secret_access_key: string
              aws_session_token: string?
              region: string?
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
        in_atl08:
          type: *id001
        in_atl08_sample:
          type: *id001
        in_landsat:
          type: *id001
        in_tile:
          type: *id001
        in_topo:
          type: *id001
      name: parameters
      type: record
outputs: {}
requirements:
  StepInputExpressionRequirement: {}
steps:
  stage_in_boreal_vect:
    in:
      cache_dir: cache_dir
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.boreal_vect)
    out:
    - output_file
    run: stage_in.cwl
  stage_in_in_atl08:
    in:
      cache_dir: cache_dir
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_atl08)
    out:
    - output_file
    run: stage_in.cwl
  stage_in_in_atl08_sample:
    in:
      cache_dir: cache_dir
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_atl08_sample)
    out:
    - output_file
    run: stage_in.cwl
  stage_in_in_landsat:
    in:
      cache_dir: cache_dir
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_landsat)
    out:
    - output_file
    run: stage_in.cwl
  stage_in_in_tile:
    in:
      cache_dir: cache_dir
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_tile)
    out:
    - output_file
    run: stage_in.cwl
  stage_in_in_topo:
    in:
      cache_dir: cache_dir
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_topo)
    out:
    - output_file
    run: stage_in.cwl
