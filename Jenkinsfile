@Library('epo-shared-jenkins-library@1.9.4-K8')_
pipelineBuild {


  docker = [
     imageName: "wipo-validator-docker",
     dir: "docker",
  ]
 staticAnalysis = [
    enabled: [       ]
  ]
  helm = [
        dir: 'helm/wipo-validator',
        publish : true
  	]

  deployments = [
      namespace : "biot",
      managed : [
          gitRepo      : 'ssh://git@bitbucket-p.internal.epo.org:7999/kd/biot.git',
          valuesPath   : 'wipo-validator',
          modify : [
                      'wipo-validator' : HELM_INSTANCE_UPDATE
                    ],
          branches: [
            'master': [
                    clusterName   : 'endurance',
                    instance      : "test",
                    targetRevision: '${env.GIT_COMMIT}',
                    helmParameters: ['application.version=${env.PROJECT_VERSION}'],
                    modify : ['wipo-validator' : HELM_INSTANCE_UPDATE]
            ],
            'develop': [
                    clusterName   : 'endurance',
                    instance      : "develop",
                    targetRevision: '${env.GIT_COMMIT}',
                    helmParameters: ['application.version=${env.PROJECT_VERSION}'],
                    modify : ['wipo-validator' : HELM_INSTANCE_UPDATE]
            ]
          ]
      ]
  ]

contacts = [
      email:  'slarie.external@epo.org, ${env.LAST_COMMIT_AUTHOR_EMAIL}'
  ]
}


