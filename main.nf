#!/usr/bin/env nextflow
params.shouldFail = true 

process fail {
  echo true
  when:
  params.shouldFail

  script:
  '''  
    echo This will keep failing until params.shouldFail is false!
    exit 1
  '''
}

process succeed {
  echo true
  output: 
  file 'x.txt' into bar_ch
  when:
  !params.shouldFail

  script:
  '''
    echo Success!
  '''
}
