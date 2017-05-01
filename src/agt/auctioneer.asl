// Agent auctioneer in project coordinationMAS

/* Initial beliefs and rules */

/* Initial goals */

!start.

/* Plans */

!start. // initial goal
 
+!start : true
   <- .broadcast(tell, auction(service, flight_ticket(paris,athens,"15/12/2015")));
      .broadcast(tell, auction(service, flight_ticket(athens,paris,"18/12/2015")));
      .at("now + 10 seconds", {+!decide(flight_ticket(paris,athens,"15/12/2015"))});
      .at("now + 12 seconds", {+!decide(flight_ticket(athens,paris,"18/12/2015"))}).
   
 // this wait 10 and 12 seconds to decide winners
       
+!decide(Service) 
   :  .findall(b(Value,Agent),bid(Service,Value)[source(Agent)],List)  // L is a list of all bids, e.g.: [b(77.7,alice), b(91.7,giacomo), ...] 
   <- .min(List,b(Value,Winner));
      .print("Winner for ", Service, " is ",Winner," with ", Value, ". Options=",List);
      .broadcast(tell, winner(Service,Winner)).


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }
