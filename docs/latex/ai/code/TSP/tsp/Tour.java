package tsp;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

public class Tour implements Comparable{
	private static Logger logger = Logger.getLogger(Tour.class.getName());
	private List lstTouredCities = new ArrayList();

	private Edge lastEdge;

	private double g = 0, h = 0, f = 0;

	protected Tour getModifiedTour(Landscape landscape, City city) {
		Tour tour = new Tour();
		tour.lstTouredCities = (List) ((ArrayList) lstTouredCities).clone();
		//tour.lastEdge=lastEdge;
		tour.addCity(city);
		tour.calculateHeuristic(landscape);
		return tour;
	}

	protected boolean isGoalTour() {
		return lstTouredCities.get(0).equals(getLastCity());
	}

	private void calculateHeuristic(Landscape landscape) {
		if(lstTouredCities.size()==0){
			return;
		}
		List lstHeuristicCities = landscape.getLstCities();
		lstHeuristicCities.removeAll(lstTouredCities);
		if (lstHeuristicCities.isEmpty()) {
			h = 0;
			return;
		}
		lstHeuristicCities.add(lstTouredCities.get(0));
		double minimumSpanningTreeCost = findMinimumSpanningTreeCost(lstHeuristicCities);
		City lastCity = getLastCity();
		Edge bestNextEdge = (Edge) lastCity.lstEdges.get(0);
		if (bestNextEdge == lastEdge) {
			bestNextEdge = (Edge) lastCity.lstEdges.get(1);

		}
		h = minimumSpanningTreeCost + bestNextEdge.getDistance();
		f=g+h;
	}

	private void addCity(City city) {
		//logger.info("lstTour.size() is "+lstTouredCities.size());
		if(lstTouredCities.size()!=0){
			
			City lastCity = getLastCity();
			Edge e = (Edge) lastCity.city2edgeMap.get(city);
			lastEdge = e;
			g += e.getDistance();
			
		}
		lstTouredCities.add(city);
	}

	private City getLastCity() {
		City lastCity = (City) lstTouredCities.get(lstTouredCities.size() - 1);
		return lastCity;

	}

	protected List getSuccessors(Landscape landscape) throws ProblemSolvedException {
		List lstCities = landscape.getLstCities();
		List lstSuccessorCities = (List) ((ArrayList) lstCities).clone();
		List lstSuccessorTours = new ArrayList();
		lstSuccessorCities.removeAll(lstTouredCities);
		if (lstSuccessorCities.isEmpty()) {
			Tour tour = getModifiedTour(landscape, (City) lstTouredCities
					.get(0));
			throw new ProblemSolvedException(tour);
			
		} else {
			Iterator newCitiesIterator = lstSuccessorCities.iterator();
			while (newCitiesIterator.hasNext()) {
				City city = (City) newCitiesIterator.next();
				Tour tour = getModifiedTour(landscape, city);
				lstSuccessorTours.add(tour);
				//logger.info(tour.toString());
			}
		}
		return lstSuccessorTours;
	}


	private static double findMinimumSpanningTreeCost(List lstCitiesToSpan) {
		double minimumSpanningTreeCost = 0;
		City city, cityA;
		List lstCitiesCovered = new ArrayList();
		int iNumCities = lstCitiesToSpan.size();
		city = (City) lstCitiesToSpan.get(0);
		Edge edge;
		while (lstCitiesCovered.size() != lstCitiesToSpan.size()) {
			lstCitiesCovered.add(city);
			int iCityEdges = city.lstEdges.size();
			for (int i = 0; i < iCityEdges; i++) {
				edge = (Edge) city.lstEdges.get(i);
				cityA = edge.getOtherTerminal(city);
				if (lstCitiesCovered.contains(cityA)) {
					continue;
				} else {
					city = cityA;
					minimumSpanningTreeCost += edge.getDistance();
					// logger.info("current cost is "+minimumSpanningTreeCost);
					break;
				}
			}
		}
		return minimumSpanningTreeCost;

	}

	public String toString() {
		String strTour="Tour g:"+g+"h:"+h+"f:"+f+":\n";
		for(int i=0;i<lstTouredCities.size();i++){
			City city = (City) lstTouredCities.get(i);
			//logger.info(city.toString());
			strTour+=city.toString()+"\n";
		}
		return strTour;
	}

	public int compareTo(Object arg0) {
		Tour otherTour=(Tour)arg0;
		if(f<otherTour.f){
			return 1;
		}
		else if(f==otherTour.f)
		return 0;
		else{
			return -1;
		}
	}
}
