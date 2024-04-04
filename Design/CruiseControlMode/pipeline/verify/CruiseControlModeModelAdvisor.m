% Copyright 2021 The MathWorks, Inc.
ma = modelAdvisorAction('CruiseControlMode'); 
ma.configFile = './tools/utilities/config_data/FuSaModelingGuidelines.json';
ma =  ma.run();
ma.generateReport();