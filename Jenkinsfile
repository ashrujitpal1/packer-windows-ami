pipeline {
    agent { docker { image 'hashicorp/packer:1.7.10' } }
    parameters {
        string(name: 'project_name', defaultValue: 'Packer Pipeline', description: 'Jenkins Pipeline for Packer')
    }
    environment {
        terraform_version = '1.2.7'
        packer_version = '1.8.3'
    }
    stages {
          stage('Install Terraform') {
              steps {
                    sh "sudo yum install wget zip -y"
                    sh "sudo cd /tmp"
                    sh "sudo curl -o bin_terraform.zip https://releases.hashicorp.com/terraform/'$terraform_version'/terraform_'$terraform_version'_linux_amd64.zip"
                    sh "sudo rm -rf terraform/"
                    sh "sudo ls -l; pwd;sudo unzip -o bin_terraform.zip"
                    sh "sudo mv terraform /usr/bin"
                    sh "sudo rm -rf bin_terraform.zip"
                    sh "sudo terraform version"
              }
          }
          /*stage('Install Packer') {
              steps {
                    sh "sudo yum install -y yum-utils"
                    sh "sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo"
                    sh "sudo yum -y install packer"
                    sh "packer version"
              }
          }
          stage('execute shell') {
              steps {
                  sh "export PACKER_LOG=1"
                  sh "export PACKER_LOG_PATH=$WORKSPACE/packer.log"
              }
          }*/
            stage('code checkout') {
               steps {
                    git branch: 'main', url: 'https://github.com/ashrujitpal1/packer-windows-ami.git'
                    }
          }
          stage('Build Windows AMI') {
                steps {
                    withAWS(credentials: 'Ashrujit-DevOps', region: 'us-east-1') {
                        dir('./packer'){
                            sh  """
                                    #!/bin/bash
                                    pwd
                                    packer init firstrun-windows.pkr.hcl; 
                                    packer build firstrun-windows.pkr.hcl
                                """
                    }
                }
            }
          }
          /*stage('Deploy??') {
                steps {
                    script {
                       withAWS(credentials: 'Ashrujit-DevOps', region: 'us-east-1') { 
                       timeout(time: 2, unit: 'MINUTES') {
                          input(id: "Deploy Gate", message: "Want to Deploy ${params.project_name}?", ok: 'Deploy??')
                       }
                       }
                    }
                }
          }
         stage('Terraform Deploy'){
             steps {
                withAWS(credentials: 'Ashrujit-DevOps', region: 'us-east-1') {
                 dir('./terraform'){

                 sh  """
                     terraform init; terraform plan; terraform apply -auto-approve
                     """

                 }
                }
             }
         }*/
    }
}
