package tsp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class City {
	private double x;
	private double y;
	protected List lstEdges=new ArrayList();
	protected Map city2edgeMap=new HashMap();
	
	public City(double d, double e) {
		x=d;
		y=e;
	}
	
	protected double getDistance(City cityB){
		double distance = Math.sqrt((x-cityB.x)*(x-cityB.x)+(y-cityB.y)*(y-cityB.y));
		return distance;
	}
	
	protected void addEdge(Edge edge){
		lstEdges.add(edge);
		city2edgeMap.put(edge.getOtherTerminal(this), edge);
	}
	
	public String toString() {
		
		return "x:"+x+" y:"+y;
	}

}
