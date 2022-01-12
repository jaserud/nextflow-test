#!/usr/bin/env nextflow
params.shouldFail = true 

process fail {
  echo true
  when:
  params.shouldFail

  script:
  '''  
    echo This will keep failing until params.failme is false!
    exit 1
  '''
}

process succeed {
  echo true
  when:
  !params.shouldFail

  script:
  '''
    echo Success!
  '''
}
