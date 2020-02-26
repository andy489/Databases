Consider <img src="https://latex.codecogs.com/svg.latex?\Large&space;P_1(a,b)"> and <img src="https://latex.codecogs.com/svg.latex?\Large&space;P_2(c,d)"> to be two points on a 2D plane.

- <img src="https://latex.codecogs.com/svg.latex?\Large&space;a"> happens to equal the minimum value in Northern Latitude (LAT_N in **STATION**).
- <img src="https://latex.codecogs.com/svg.latex?\Large&space;b"> happens to equal the minimum value in Western Longitude (LONG_W in **STATION**).
- <img src="https://latex.codecogs.com/svg.latex?\Large&space;c"> happens to equal the maximum value in Northern Latitude (LAT_N in **STATION**).
- <img src="https://latex.codecogs.com/svg.latex?\Large&space;d"> happens to equal the maximum value in Western Longitude (LONG_W in **STATION**).

Query the [Manhattan Distance](https://xlinux.nist.gov/dads/HTML/manhattanDistance.html) between points <img src="https://latex.codecogs.com/svg.latex?\Large&space;P_1"> and <img src="https://latex.codecogs.com/svg.latex?\Large&space;P_2"> and round it to a scale of <img src="https://latex.codecogs.com/svg.latex?\Large&space;4"> decimal places.

#### Input Format

The **STATION** table is described as follows:

![](https://github.com/andy489/Database/blob/master/assets/Weather%20Observation%20Station%201.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude. 
