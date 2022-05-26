Feature: Managing Services and Clients

  Sometimes it's necessary to add an remove mocked services and clients at run
  time to execute a particular test.  The steps for managing these operations
  are demonstrated by these scenarios.

  TODO: The gem supports both secure and insecure connections.  Testing the secure
  services requires a certificate and some fiddling.

  Background:
    Given the package prefix is 'Calculator::'

  Scenario: Clear the services, clients, and servers
    Given I clear the services
    And I clear the clients
    And I clear the servers
    Then there are no services stored
    And there are no clients stored
    And there are no servers stored

  Scenario: Remove a service and client
    Given I remove the service with name 'Calculator'
    And I remove the client with name 'Calculator'
    And I remove the server with name 'calculator_server'
    Then the service with name 'Calculator' is not stored in the services
    And the client with name 'Calculator' is not stored in the clients
    And the server with name 'calculator_server' is not stored in the servers
    And there are 0 clients stored
    And there are 0 servers stored
    And there are 0 services stored

  @no_server_services_clients
  Scenario: Add a mock service and start the mock server dynamically
    Given I add the service 'CalculatorService' with name 'MyCalculator'
    # And I add a client with name 'MyCalculator', package name '::Calculator::Calculator', host 'localhost', port 12345, service_endpoint 'nil', cred 'server.crt', and channel 'CHANNEL_NAME'
    And I add a client with name 'MyCalculator', package name '::Calculator::Calculator', host 'localhost', port 12345
    And I reset the server 'calculator_server' with service 'MyCalculator'
    When I call the 'binary_operation' method in the MyCalculator service with an 'BinaryRequest' that looks like
      """
      {
        "x": 2,
        "y": 3,
        "operand": "=="
      }
      """
    Then the 'boolean_result' field in the response object is false
    And the service with name 'MyCalculator' is stored in services
    And the client with name 'MyCalculator' is stored in the clients

  Scenario: Add an additional mock service
    Given I add the service 'CalculatorService' with name 'AnotherCalculator'
    # And I add a client with name 'MyCalculator', package name '::Calculator::Calculator', host 'localhost', port 12345, service_endpoint 'nil', cred 'server.crt', and channel 'CHANNEL_NAME'
    And I add a client with name 'MyCalculator', package name '::Calculator::Calculator', host 'localhost', port 12345
    Then there are 2 services stored
    And there are 2 clients stored
    And there is 1 server stored
