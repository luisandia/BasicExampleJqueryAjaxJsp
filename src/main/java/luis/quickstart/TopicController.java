package luis.quickstart;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;

@RestController
public class TopicController {
	
	@Autowired
	private TopicService topicService;
	
	@RequestMapping("/more")
	public String more() {
		Gson gson = new Gson(); 
		String json = gson.toJson(topicService.getAllTopics()); 
		return json;
	}
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String doSave(@RequestBody Map<String, Object> payload){
    	Gson gson = new Gson(); 
        return  gson.toJson(topicService.findTopic(payload.get("name").toString().toLowerCase()));
    }
	@RequestMapping("/")
	public ModelAndView SayHi() {
        ModelAndView mv = new ModelAndView("welcome");
        mv.addObject("lists",topicService.getAllTopics());
		return mv;
	}
	
}
