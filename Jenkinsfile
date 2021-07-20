@Library('epo-shared-jenkins-library@1.9.4-K8')_
pipelineBuild {

  docker = [
     imageName: "biot-validator-config-docker",
     dir: "docker",
  ]

  helm = [[
        dir: 'svs',
        publish : true
  	]]

  staticAnalysis = [
    enabled: []
  ]

  deployments = [
      namespace : "biot",
      managed : [
          gitRepo      : 'ssh://bitbucket-p.internal.epo.org/scm/biot/svs.git',
          valuesPath   : 'svs',
          branches: [
            'master': [
                [
                    clusterName   : 'endurance',
                    instance      : "master",
                    targetRevision: '${env.GIT_COMMIT}',
                    helmParameters: ['application.version=${env.PROJECT_VERSION}']
                ]
            ]
          ]
      ]
  ]

contacts = [
      email:  'ppinta.external@epo.org, ${env.LAST_COMMIT_AUTHOR_EMAIL}'
  ]
}


