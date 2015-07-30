import xml.dom.minidom as dom
from subprocess import call
from random import randint

duraRouterDirectory = "C:\\veinsSimConnectionToUnity\\Veins\\sumo-0.21.0\\bin\\duarouter";
#tripFile = "C:\\veinsSimConnectionToUnity\\Veins\\darmstadt\\trips.xml";
tripFile = "E:\\Dropbox\\DoktorrandKOM\\HiwiUnityProjektVeins\\SumoSzenarios\\trips.xml";
#netFile = "C:\\veinsSimConnectionToUnity\\Veins\darmstadt\\darmstadt.net.xml";
#outputFile= " E:\\Dropbox\\DoktorrandKOM\\SumoSzenarios\\darmstadt.rou.xml";

netFile = "C:\\veinsSimConnectionToUnity\\Veins\\veins-4a2\\veins-veins-4a2\\examples\\veins\\erlangen.net.xml";
outputFile= " E:\\Dropbox\\DoktorrandKOM\\HiwiUnityProjektVeins\\SumoSzenarios\\erlangen.rou.xml";


startEdgeList=[];
endEdgeList=[];

startEdgesToBeUsed=[];
endEdgesToBeUsed=[];

numberOfDifferentStartEndPoints = 10;
numberOfCars = 10000;






#open file for writing later #########################

fobj_out = open(tripFile,"w");
fobj_out.write("<trips>\n");






####function definition#########################

def printTripLine(counter,start,ziel):
        fobj_out.write("<trip id=\""+str(counter)+"\" depart = \"10\" from=\""+start+"\"  to=\""+ziel+"\"/>\n");
        return;
######

def getZufallsZahl(range):

        return randint(0, range);
        






#########################################################################
#########################################################################
# MAIN PROGRAMM
#########################################################################
#########################################################################



print("Conversion is running");

#########################################################################
# read all edges from file 
#########################################################################

baum = dom.parse(netFile);


for eintrag in baum.childNodes:
        for knoten in eintrag.childNodes:
                if knoten.nodeName == "edge" and "#" in knoten.getAttribute("id"):
                                #print(knoten.nodeName);
                                #print(knoten.getAttribute("id"));
                                newstr = str(knoten.getAttribute("id")).replace(":", "");
                                startEdgeList.append(newstr);
                                endEdgeList.append(newstr);
                                #fobj_out.write(str(knoten.getAttribute("id")) + "\n");




#########################################################################
# load road start/end points to be used 
#########################################################################
counterCurrentStartEndPoint=0;

if(numberOfDifferentStartEndPoints<len(endEdgeList)):
        while(counterCurrentStartEndPoint<numberOfDifferentStartEndPoints):
                 startEdgeNumber = getZufallsZahl(len(startEdgeList)-1);
                 endEdgeNumber = getZufallsZahl(len(endEdgeList)-1);
                 startEdgesToBeUsed.append(startEdgeList.pop(startEdgeNumber));
                 endEdgesToBeUsed.append(endEdgeList.pop(endEdgeNumber));
                 counterCurrentStartEndPoint=counterCurrentStartEndPoint+1;



#########################################################################
# write out trip-file 
#########################################################################

counterCurrentCar=0;
 
while (counterCurrentCar < numberOfCars):
                                startEdgeNumber = getZufallsZahl(len(startEdgesToBeUsed)-1);
                                endEdgeNumber = getZufallsZahl(len(endEdgesToBeUsed)-1);
                                startEdge = startEdgesToBeUsed.pop(startEdgeNumber);
                                endEdge = endEdgesToBeUsed.pop(endEdgeNumber);
                                printTripLine(counterCurrentCar,startEdge,endEdge);
                                startEdgesToBeUsed.append(startEdge);
                                endEdgesToBeUsed.append(endEdge);
                                counterCurrentCar=counterCurrentCar+1;


                
fobj_out.write("</trips>");
fobj_out.close();




#########################################################################
#execute durarouter to find the routes for all the trips
#########################################################################


print(duraRouterDirectory+" --trip-files "+tripFile+"  -n"+netFile+" -o "+outputFile);
returncode = call(duraRouterDirectory+" --trip-files "+tripFile+"  -n"+netFile+" -o "+outputFile, shell=True);
print(returncode);


                                      
