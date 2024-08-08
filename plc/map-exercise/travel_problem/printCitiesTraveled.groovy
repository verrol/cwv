// /usr/local/bin/groovy

def cities = [
     new BoardingPass(fromCity: 'Del', toCity: 'NC'),
     new BoardingPass(fromCity: 'NY', toCity: 'Del'),
     new BoardingPass(fromCity: 'Mia', toCity: 'SF'),
     new BoardingPass(fromCity: 'SF', toCity: 'LA'),
     new BoardingPass(fromCity: 'LA', toCity: 'NY'),
     new BoardingPass(fromCity: 'Chi', toCity: 'Mia'),
   ]


printCitiesTraveled(cities)


class BoardingPass{
   String fromCity;
   String toCity;
}


void printCitiesTraveled(List<BoardingPass> traveledCities){

     // map to index fromCity to toCity
     def cityLookup = [:];
     def cityFreq = [:];

// ----- Phase 1
      // for each boarding pass in unordered set, index into map for easy look up for travel
     traveledCities.each{bp ->
           cityLookup[bp.getFromCity()] = bp.getToCity() // same as cityLookup.put(key, value)
           cityFreq[bp.getFromCity()] = cityFreq.get(bp.getFromCity(), 0) + 1; /// get the current value in the map, if none, then return 0, add 1 to whatever is returned
           cityFreq[bp.getToCity()] = cityFreq.get(bp.getToCity(), 0) + 1
      }
// ------  phase 2

     def startCity = null;


      // find the city we started, it will have a frequency of 1 and exit in the cityLookup
      cityFreq.each{pair ->
          if((1 == pair.value) && cityLookup.containsKey(pair.key)){
              startCity = pair.key
          }
      } 
      

// ----- phase 3

     // now just start with the start city, and walk the cityLookup
    boolean done = false;
    String fromCity = startCity;
    print(fromCity);
    
    while(!done) {
       
      print(" -> ");
      print( cityLookup[fromCity]) // this get to city

      fromCity = cityLookup[fromCity] ; // get the next from city
      if(!cityLookup.containsKey(fromCity)){
         done = true;
      }
     } 
    println('')
   
}

// Chi -> Mia ->  SF -> LA -> NY -> Del