#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
class: Workflow
cwlVersion: v1.2
inputs:
  cache_dir: Directory?
  cache_only:
    default: false
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
        beams: string
        columns: string
        granules:
          type: *id001
        lat: string
        lon: string
        query: string
      name: parameters
      type: record
  stage_out:
    type:
    - fields:
        aws_access_key_id: string
        aws_secret_access_key: string
        aws_session_token: string
        region_name: string
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
requirements:
  StepInputExpressionRequirement: {}
steps:
  process:
    in:
      aoi: stage_in_aoi/output_files
      beams:
        source: parameters
        valueFrom: $(self.beams)
      columns:
        source: parameters
        valueFrom: $(self.columns)
      granules: stage_in_granules/output_files
      lat:
        source: parameters
        valueFrom: $(self.lat)
      lon:
        source: parameters
        valueFrom: $(self.lon)
      query:
        source: parameters
        valueFrom: $(self.query)
    out:
    - output_nb
    - output_dir
    run: process.cwl
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
  stage_out:
    in:
      output_dir: process/output_dir
      output_nb: process/output_nb
      output_path: stage_out
    out: []
    run: stage_out.cwl
