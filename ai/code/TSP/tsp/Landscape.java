package tsp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Landscape {
	private static Logger logger = Logger.getLogger(Landscape.class.getName());
	static {
		logger.setLevel(Level.ALL);
	}

	private static int DEFAULT_NUM_CITIES = 3;

	private ArrayList lstCities = new ArrayList();

	private List lstEdges = new ArrayList();

	private int iNodesExpanded = 0;

	private static List lstNodesExpandedRecord = new ArrayList(),
			lstRuntimeRecord = new ArrayList(),
			lstGraphSizeRecord = new ArrayList();

	protected List getLstCities() {
		return (List) lstCities.clone();
	}

	private void findDistances() {
		Edge edge;
		for (int i = 0; i < lstCities.size(); i++) {
			City srcCity = (City) lstCities.get(i);
			for (int j = i + 1; j < lstCities.size(); j++) {
				City destCity = (City) lstCities.get(j);
				edge = new Edge(srcCity, destCity);
				lstEdges.add(edge);
				srcCity.addEdge(edge);
				destCity.addEdge(edge);
			}
		}
		Collections.sort(lstEdges);
		for (int i = 0; i < lstCities.size(); i++) {
			City srcCity = (City) lstCities.get(i);
			Collections.sort(srcCity.lstEdges);
		}
	}

	private void generateProblem(int iNumCities) {
		for (int i = 0; i < iNumCities; i++) {
			City city = new City(Math.random(), Math.random());
			lstCities.add(city);
		}
		findDistances();
	}

	private void solveProblem() throws ProblemSolvedException {
		if (lstCities.size() <= 2) {
			return;
		}
		Tour tour = new Tour();
		List lstTours = new ArrayList(), lstNewTours;
		lstTours.add(tour);
		while (true) {
			tour = (Tour) lstTours.get(0);
			lstNewTours = tour.getSuccessors(this);
			iNodesExpanded++;
			lstTours.addAll(lstNewTours);
			// logger.info("lstNewTours:"+lstNewTours.size());
			// logger.info("lstTours:"+lstTours.size());
			lstTours.remove(tour);
			// logger.info("lstTours:"+lstTours.size());

			Collections.sort(lstTours);
		}
	}

	public String toString() {
		String strLandscape = "";
		City city;
		for (int i = 0; i < lstCities.size(); i++) {
			city = (City) lstCities.get(i);
			strLandscape += city.toString();
			strLandscape += "\n";
		}
		return strLandscape;
	}

	private static void getMetrics() {
		for (int iNumCities = 3; iNumCities <= 7; iNumCities++) {
			Landscape landscape = new Landscape();
			landscape.generateProblem(iNumCities);
			//logger.info("Landscape is:\n" + landscape.toString());
			long initTime = System.currentTimeMillis();
			try {
				landscape.solveProblem();
			} catch (ProblemSolvedException e) {
				logger.info("Tour completed:" + e.toString());
				// e.printStackTrace();
				
			}
			long endTime = System.currentTimeMillis();
			long runTime = endTime - initTime;
			lstNodesExpandedRecord.add(new Long(landscape.iNodesExpanded));
			lstRuntimeRecord.add(new Long(runTime));
			lstGraphSizeRecord.add(new Long(iNumCities));
			//logger.info("ola");

		}

	}

	private static String toMatlabFormat(List record) {
		String strRecords = "";
		for (int i = 0; i < record.size(); i++) {
			long recordItem;
			Long recordObject = (Long) record.get(i);
			recordItem = recordObject.longValue();
			strRecords += recordItem;
			strRecords += "\n";
		}
		return strRecords;
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// /logger.info("number of args :"+args.length);
		int iNumCities;
		if (args.length > 0) {
			// logger.info(args[0]);
			iNumCities = new Integer(args[0]).intValue();
		} else {
			iNumCities = DEFAULT_NUM_CITIES;
		}
		Landscape landscape = new Landscape();
		landscape.generateProblem(iNumCities);
		logger.info("Landscape is:\n" + landscape.toString());
		// logger.info("minimum Spanning tree check:"
		// + findMinimumSpanningTreeCost(landscape.lstCities));
		getMetrics();
		logger.info("NCities:\n"+toMatlabFormat(lstGraphSizeRecord) + "\n");
		logger.info("NodesExp:\n"+toMatlabFormat(lstNodesExpandedRecord) + "\n");
		logger.info("Runtime:\n"+toMatlabFormat(lstRuntimeRecord) + "\n");

	}

}
