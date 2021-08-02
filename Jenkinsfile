@Library('epo-shared-jenkins-library@1.9.4-K8')_
pipelineBuild {

  docker = [
     imageName: "svs-docker",
     dir: "docker",
  ]

  helm = [
        dir: 'helm',
        publish : true
  	]

  staticAnalysis = [
    enabled: []
  ]

  deployments = [
      namespace : "biot",
      managed : [
          gitRepo      : 'ssh://git@bitbucket-p.internal.epo.org:7999/kd/biot.git',
          valuesPath   : 'svs',
          branches: [
            'master': [
                    clusterName   : 'endurance',
                    instance      : "master",
                    targetRevision: '${env.GIT_COMMIT}',
                    helmParameters: ['application.version=${env.PROJECT_VERSION}']
            ]
          ]
      ]
  ]

contacts = [
      email:  'ppinta.external@epo.org, ${env.LAST_COMMIT_AUTHOR_EMAIL}'
  ]
}


