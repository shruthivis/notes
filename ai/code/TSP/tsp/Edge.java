package tsp;

public class Edge implements Comparable{

	private City srcCity;

	private City destCity;
	
	private double distance;
	
	public double getDistance() {
		return distance;
	}

	Edge(City cityA, City cityB){
		srcCity=cityA;
		destCity=cityB;
		distance = cityA.getDistance(cityB);
	}

	public int compareTo(Object o) {
		Edge edgeB = (Edge)o;
		if(edgeB.distance == distance)
			return 0;
		else if(distance<edgeB.distance)
			return -1;
		else{
			return 1;
		}
	}
	
	protected City getOtherTerminal(City cityA){
		if(cityA==srcCity){
			return destCity;
		}
		else if(cityA==destCity){
			return srcCity;
		}
		else
			return null;
	}

}
