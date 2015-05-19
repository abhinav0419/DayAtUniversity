package com.ojt.controller;

import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ojt.pojo.DaySchudle;


@Controller
public class HomeController {

	@RequestMapping(value ="/schedule")
	public String setSchudler(Model model){
		model.addAttribute("getSchedule", new DaySchudle());
		return "schedule";
	}


	@RequestMapping(value ="/second", method = RequestMethod.POST)
	public String getSchudler(DaySchudle getSchedule,ModelMap maplocation ,ModelMap modelcity,ModelMap modelstate,ModelMap modelcountry,
			ModelMap modelbuilding,ModelMap modeltime,ModelMap modelcourse){
		
		ArrayList<String> building=new ArrayList<String>();
		building.add(getSchedule.getBld());
		List<String> buildings = Arrays.asList(building.get(0).split("\\s*,\\s*"));
		modelbuilding.addAttribute("buildings", buildings);
		if(buildings.isEmpty()){
			return "nobuilding";
		}


		ArrayList<String> city=new ArrayList<String>();
		city.add(getSchedule.getCity());
		List<String> cities = Arrays.asList(city.get(0).split("\\s*,\\s*"));
		modelcity.addAttribute("cities", cities);
		if(cities.isEmpty()){
			return"nocity";
		}


		ArrayList<String> state=new ArrayList<String>();
		state.add(getSchedule.getState());
		List<String> states = Arrays.asList(state.get(0).split("\\s*,\\s*"));
		modelstate.addAttribute("states", states);
		if(states.isEmpty()){
			return"nostate";
		}

		ArrayList<String> country=new ArrayList<String>();
		country.add(getSchedule.getCountry());
		List<String> countries = Arrays.asList(country.get(0).split("\\s*,\\s*"));
		modelcountry.addAttribute("countries", countries);
		if(countries.isEmpty()){
			return"nocountry";
		}



		ArrayList<String> time=new ArrayList<String>();
		time.add(getSchedule.getTime1());
		List<String> timing = Arrays.asList(time.get(0).split("\\s*,\\s*"));
		modeltime.addAttribute("timing", timing);
		
		
		ArrayList<String> course=new ArrayList<String>();
		course.add(getSchedule.getCourse());
		List<String> courses = Arrays.asList(course.get(0).split("\\s*,\\s*"));
		modelcourse.addAttribute("courses", courses);
		if(courses.isEmpty()){
			return "nocourses";
		}
		

		ArrayList<String> locationOnMap=new ArrayList<String>();
		for(int i=0;i<cities.size();i++){
			String locationTemp=buildings.get(i)+","+cities.get(i)+","+states.get(i)+","+countries.get(i);
			locationOnMap.add(locationTemp);
		}
		maplocation.addAttribute("locationOnMap", locationOnMap);
		
/*		String locationfirst=buildings.get(0)+","+cities.get(0)+","+states.get(0)+","+countries.get(0);
		ArrayList<String> flocation=new ArrayList<String>();
		flocation.add(locationfirst);
		firstlocation.addAttribute("flocation",	 flocation);
		if(cities.size()==2){
			String locationsecond=buildings.get(1)+","+cities.get(1)+","+states.get(1)+","+countries.get(1);
			ArrayList<String> slocation=new ArrayList<String>();
			slocation.add(locationsecond);
			secondlocation.addAttribute("slocation",	 slocation);}
		if(cities.size()==3){
			String locationthird=buildings.get(2)+","+cities.get(2)+","+states.get(2)+","+countries.get(2);
			ArrayList<String> tlocation=new ArrayList<String>();
			tlocation.add(locationthird);
			thirdlocation.addAttribute("tlocation",	 tlocation);
		}
*/
		return "second";
	}


	@RequestMapping(value="/currentLocate")
	public String current(){
		return "currentlocation";
	}

}