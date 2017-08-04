package tsp;

public class ProblemSolvedException extends Exception{
	
	private Tour solutionTour;

	public ProblemSolvedException(Tour tour) {
		solutionTour=tour;
	}
	public String toString() {
		
		return solutionTour.toString();
	}

}
