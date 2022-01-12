#!/usr/bin/env nextflow
params.failme = true 

process fail {
  echo true
  when:
  params.failme

  script:
  '''  
    echo This will keep failing until params.failme is false!
    exit 1
  '''
}

process succeed {
  echo true
  output: 
  file 'x.txt' into bar_ch
  when:
  !params.failme

  script:
  '''
    echo Success!
  '''
}
