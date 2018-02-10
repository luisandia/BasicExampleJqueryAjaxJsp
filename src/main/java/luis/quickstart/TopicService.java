package luis.quickstart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class TopicService {

		private List<Topic> topics = Arrays.asList(
				new Topic("Spring","Spring Framework","Spring Framework Migration"),
				new Topic("Java","Core Framework","Core Java Migration"),
				new Topic("Javascript","Javascript Framework","Javascript descripction"),
				new Topic("Django","Django Framework","Django con Postgresql")
				/*new Topic("Angular5","Angular5 Framework","Angular con REST-PHP")*/

		);
		public List<Topic> getAllTopics() {
			Collections.shuffle(topics);
			return topics;
		}
		public List<Topic> findTopic(String id) {
			List<Topic> res = new ArrayList<Topic>();
		    for (Topic topic : topics) {
		        if (topic.getId().toLowerCase().contains(id) ||topic.getName().toLowerCase().contains(id) || topic.getDescription().toLowerCase().contains(id) ) {
		            res.add(topic);
		        }
		    }
		    return res; 
		}
}
