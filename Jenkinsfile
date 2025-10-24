pipeline {
    environment {
        API_SERVER_URL = "http://127.0.0.1:8000"
        API_TOKEN = credentials("API_TOKEN")
    }
    agent any
    stages {
        stage("run local API") {
                steps {
                    dir("api") {
                        git url: "https://github.com/qa-tech-training/BOA_Production_API.git", branch: "main"
                        sh "docker compose -f api/docker-compose.yml up -d --build"
                    }
                }
        }
        stage("install ansible module") {
            steps {
                dir("ansible_collections/custom/bankx") {
                    git url: "https://github.com/qa-tech-training/custom-ansible-module.git", branch: "main"
                    sh "ansible-galaxy collection install ."
                }
            }
        }
        stage("use ansible to create a sandbox") {
            steps {
                    sh "sed -i 's,<endpoint>,'${API_SERVER_URL}',g;' playbook.yml"
                    sh "sed -i 's,<token>,'${API_TOKEN}',g;' playbook.yml"
                    sh "ansible-playbook playbook.yml"
            }
        }
    }
    post {
        always {
            dir("api") {
                sh "docker compose -f api/docker-compose.yml down"
            }
        }
    }
}
