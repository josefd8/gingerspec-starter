Feature: Testing backend related functionality

  This class provides an example on how to use other functionality of the testing library (functionality
  related to the use of variables, JSON replacing, etc).

  Execute this tests like this: mvn verify -Dit.test=${groupId}.${artifactId}.${package}.CucumberBackendIT

  You can check a more complete list of steps and examples at:
  https://confluence.vptech.eu/pages/viewpage.action?pageId=5442503

  Scenario: Storing environmental variables in the feature
    Given I run 'ls -l' locally with exit status '0' and save the value in environment variable 'DEFEXSTAT'
    Then '!{DEFEXSTAT}' contains 'total'

  Scenario: Read JSON file
    Given I read file 'schemas/testCreateFile.json' as 'json' and save it in environment variable 'myjson' with:
      | $.key1 | UPDATE | new_value     | n/a   |
      | $.key2 | ADDTO  | ["new_value"] | array |
    When I run 'echo "!{myjson}"' locally
    Then the command output contains '{key1:new_value,key2:[[new_value]],key3:{key3_2:value3_2,key3_1:value3_1}}'

  Scenario: Read string file
    Given I read file 'schemas/config.conf' as 'string' and save it in environment variable 'mystring' with:
      | foo | REPLACE |  bar    | n/a   |
    When I run 'echo "!{mystring}"' locally
    Then the command output contains 'bar = bar'