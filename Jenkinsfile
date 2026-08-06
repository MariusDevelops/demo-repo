pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo "Code checked out from GitHub"
                sh 'ls -la'
            }
        }

        stage('Validate Scripts') {
            steps {
                echo "Validating shell scripts..."
                sh '''
                    bash -n scripts/*.sh
                    echo "Scripts are valid"
                '''
            }
        }

        stage('Test Scripts') {
            steps {
                echo "Running scripts..."
                sh '''
                    chmod +x scripts/*.sh

                    ./scripts/system-info.sh
                    ./scripts/health-check.sh
                '''
            }
        }

        stage('Deploy Scripts') {
            steps {
                echo "Deploying scripts..."

                sh '''
                    mkdir -p /home/ssm-user/bootcamp-labs/scripts

                    cp scripts/*.sh /home/ssm-user/bootcamp-labs/scripts/

                    chmod +x /home/ssm-user/bootcamp-labs/scripts/*.sh

                    echo "Deployment complete"
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline succeeded!"
        }

        failure {
            echo "Pipeline failed!"
        }
    }
}