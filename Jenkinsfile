pipeline {
    agent any
    stages {

     stage('Checkout') {
                 steps {
                     echo 'Checking out source code...'
                     checkout scm
                 }
             }

        stage('Kiểm tra thay đổi trong thư mục') {
            steps {
                script {
                    def exitCode = sh(
                        script: "git diff --name-only HEAD~1 HEAD | grep -q '^helm/'",
                        returnStatus: true
                    )

                    if (exitCode == 0) {
                        echo "Có thay đổi trong thư mục 'my-folder':"
                        echo changes
                        currentBuild.description = "Thanh test"
                    } else {
                        echo "Không có thay đổi trong thư mục 'my-folder'."
                    }
                }
            }
        }
    }
}
