import xml.dom.minidom as dom
from subprocess import call
from random import randint

duraRouterDirectory = "C:\\veinsSimConnectionToUnity\\Veins\\sumo-0.21.0\\bin\\duarouter";
#tripFile = "C:\\veinsSimConnectionToUnity\\Veins\\darmstadt\\trips.xml";
tripFile = "E:\\Dropbox\\DoktorrandKOM\\SumoSzenarios\\trips.xml";
netFile = "C:\\veinsSimConnectionToUnity\\Veins\darmstadt\\darmstadt.net.xml";
outputFile= " E:\\Dropbox\\DoktorrandKOM\\SumoSzenarios\\darmstadt.rou.xml";


startEdgeList=[];
endEdgeList=[];

numberOfDifferentRoutes = 2500;






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
# write out trip-file 
#########################################################################

counterX=0;
 
if(numberOfDifferentRoutes<len(endEdgeList)):
          while (counterX < numberOfDifferentRoutes):
                startEdge = getZufallsZahl(len(startEdgeList)-2);
                endEdge = getZufallsZahl(len(endEdgeList)-2);
                printTripLine(counterX,startEdgeList.pop(startEdge),endEdgeList.pop(endEdge));
                counterX=counterX+1;


                
fobj_out.write("</trips>");
fobj_out.close();




#########################################################################
#execute durarouter to find the routes for all the trips
#########################################################################


print(duraRouterDirectory+" --trip-files "+tripFile+"  -n"+netFile+" -o "+outputFile);
returncode = call(duraRouterDirectory+" --trip-files "+tripFile+"  -n"+netFile+" -o "+outputFile, shell=True);
print(returncode);


                                      
