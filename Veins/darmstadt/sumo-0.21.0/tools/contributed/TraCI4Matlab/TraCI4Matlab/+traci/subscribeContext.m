function subscribeContext(cmdID, subscriptionBegin, subscriptionEnd, objID, domain, dist, varIDs)
%subscribeContext An internal function to build a context subscription
%command and parse the response.

%   Copyright 2013 Universidad Nacional de Colombia,
%   Politecnico Jaime Isaza Cadavid.
%   Authors: Andres Acosta, Jairo Espinosa, Jorge Espinosa.
%   $Id: subscribeContext.m 17 2014-05-30 14:32:09Z afacostag $

global message
global loopSubscriptionResults laneSubscriptionResults vehSubscriptionResults ...
    poiSubscriptionResults polygonSubscriptionResults junctionSubscriptionResults ...
    edgeSubscriptionResults

if strcmp(domain,'0xa0')
    loopSubscriptionResults = traci.SubscriptionResults(traci.RETURN_VALUE_FUNC.inductionloop);
elseif strcmp(domain,'0xa3')
    laneSubscriptionResults = traci.SubscriptionResults(traci.RETURN_VALUE_FUNC.lane);
elseif strcmp(domain,'0xa4')
    vehSubscriptionResults = traci.SubscriptionResults(traci.RETURN_VALUE_FUNC.vehicle);
elseif strcmp(domain,'0xa7')
    poiSubscriptionResults = traci.SubscriptionResults(traci.RETURN_VALUE_FUNC.poi);
elseif strcmp(domain,'0xa8')
    polygonSubscriptionResults = traci.SubscriptionResults(traci.RETURN_VALUE_FUNC.polygon);
elseif strcmp(domain,'0xa9')
    junctionSubscriptionResults = traci.SubscriptionResults(traci.RETURN_VALUE_FUNC.junction);
elseif strcmp(domain,'0xaa')
    edgeSubscriptionResults = traci.SubscriptionResults(traci.RETURN_VALUE_FUNC.edge);
end

message.queue = [message.queue uint8(sscanf(cmdID,'%x'))];
len = 1+1+4+4+4+length(objID)+1+8+1+length(varIDs);
if len<=255
    message.string = [message.string uint8(len)];
else
    message.string = [message.string uint8(0) traci.packInt64(len+4)];
end
message.string = [message.string uint8(sscanf(cmdID,'%x')),...
    traci.packInt32([length(objID)...
    subscriptionEnd subscriptionBegin]) uint8(objID)];
message.string = [message.string uint8(sscanf(domain,'%x')) ...
    traci.packInt64(dist) uint8(length(varIDs))];
for i=1:length(varIDs)
    message.string = [message.string uint8(sscanf(varIDs{i},'%x'))];
end
result = traci.sendExact();
[response, objectID] = traci.readSubscription(result);
if response - uint8(sscanf(cmdID,'%x'))~=16 || ~strcmp(objectID,objID) 
    raise(MException('traci:FatalTraciError','Received answer %.2X,%s for context subscription command %.2X,%s\n',...
        response, objectID, cmdID, objID));
end