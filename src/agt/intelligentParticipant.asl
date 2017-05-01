// Agent intelligentParticipant in project coordinationMAS

/* Initial beliefs and rules */

/* Initial goals */


/* Plans */

+auction(service, ServDescription)[source(Agent)] 
<- .broadcast(tell,bid(ServDescription, math.random * 100 + 10)).

+bid(ServDesc,_) : not .desire( bid(ServDesc)) & not winner(ServDesc,_) <- !bid(ServDesc).

+!bid(ServDesc) 
   <- .wait(1000);
      .findall(Value,bid(ServDesc,Value),List);
      .min(List,MinValue);
      .broadcast(tell,bid(ServDesc, MinValue*0.9));
      .print("Bid ",MinValue*0.9, " for ",ServDesc).
 
+winner(ServDesc,Winner) : .my_name(Winner) <- .print("I Won!").

+winner(ServDesc,Winner) : .desire(bid(ServDesc)) <- .drop_intention(bid(ServDesc)).
   
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }
