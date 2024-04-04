pipeline {
    agent any    
    environment {        
        WORK_PATH = "\\01_MW_Works\\CICD\\Jenkins_localWorking\\MBD_Example_Jenkin_pipeline"
    }

    stages {
        stage('Static Analysis') {                        
            parallel {
                stage('CruiseControlMode') {
                    steps {
                        echo "--- Check Modeling Guidelines and Run-time errors ---"
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); CruiseControlModeModelAdvisor;'                        
                    }
                }

                 stage('DriverSwRequest') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); DriverSwRequestModelAdvisor;'
                    }
                }

                stage('TargetSpeedThrottle') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); TargetSpeedThrottleModelAdvisor;'
                    }
                }

                stage('crs_controller') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); crs_controllerModelAdvisor;'
                    }
                }
            }
        }

        stage('Dynamic Analysis') {            
            parallel {
                stage('CruiseControlMode') {
                    steps {
                        echo "--- Requirements Based Testing and Coverage collection ---"                        
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); CruiseControlModeTest;'
                        //publishCoverage adapters: [cobertura('C:${WORK_PATH}\\Models\\CruiseControlMode\\Verification_results\\mil_test_results')], checksName: '', sourceFileResolver: sourceFiles('NEVER_STORE')
                    }
                }

                 stage('DriverSwRequest') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); DriverSwRequestTest;'
                    }
                }

                stage('TargetSpeedThrottle') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); TargetSpeedThrottleTest;'
                    }
                }

                stage('crs_controller') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); crs_controllerTestFile;'
                    }
                }
            }            
        }

        stage('Build') {                        
            parallel {
                stage('CruiseControlMode') {
                    steps {
                        echo "--- Code generation ---"
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); CruiseControlModeBuild;'                        
                    }
                }

                 stage('DriverSwRequest') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); DriverSwRequestBuild;'
                    }
                }

                stage('TargetSpeedThrottle') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); TargetSpeedThrottleBuild;'
                    }
                }

                stage('crs_controller') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); crs_controllerBuild;'
                    }
                }
            }             
        }

        stage('Equivalence Testing') {            
            parallel {
                stage('CruiseControlMode') {
                    steps {
                        echo "--- Equivalece check between Models and the generated codes ---"
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); CruiseControlModeEquivalenceTest;'
                    }
                }

                 stage('DriverSwRequest') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); DriverSwRequestEquivalenceTest;'
                    }
                }

                stage('TargetSpeedThrottle') {
                    steps {
                        runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); TargetSpeedThrottleEquivalenceTest;'
                    }
                }

                // stage('crs_controller') {
                //     steps {
                //         runMATLABCommand 'cd C:${WORK_PATH}, openProject(\'CruiseControl.prj\'); crs_controllerEquivalenceTest;'
                //     }
                // }
            }              
        }        

        stage('Packaging') {
            steps{
                echo "--- Archiving the final artifacts ---"
                
            }
        }
    }
}