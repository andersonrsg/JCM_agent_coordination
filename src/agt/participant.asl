// Agent participant in project coordinationMAS

/* Initial beliefs and rules */

/* Initial goals */

/* Plans */

+auction(service, ServDesc)[source(Agent)] 
<- .broadcast(tell,bid(ServDesc, math.random * 100 + 10)).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }
