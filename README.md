# Gatling docker setup

This is repo running load test with gatling inside docker containers. It does following things

 * Docker image and contaners with Gatling setup 

 * Generate report in HTML.

 * Easy to use bash scripts plauggable with Jenkins or any other CI server
 
 * Present data on web interface localhost:8081 
 
## Running Gatling Test Inside Docker Containers

* Start `docker-compose` process 

      $ docker-compose up -d
             
* Run `Gatling` tests with helper 

      $ docker-compose exec gatling run [TestName] 

### Pre-defined Simulation 

* See inside directory `docker/gatling/user-files/simulations`      

### Mount your own Simulation 

* To mount new simulations simply add new `Scala` classes into 
`docker/gatling/user-files/simulations`
 
