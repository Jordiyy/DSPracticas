package basenostates.requests;
import basenostates.DirectoryAreas;
import basenostates.areas.Area;
import org.json.JSONArray;
import org.json.JSONObject;
public class RequestChildren implements Request{
  private final String areaId;
  private JSONObject jsonTree; // 1 level tree, root and children

  public RequestChildren(String areaId) {
    this.areaId = areaId;
  }

  public String getAreaId() {
    return areaId;
  }

  @Override
  public JSONObject answerToJson() {
    return jsonTree;
  }

  @Override
  public String toString() {
    return "RequestChildren{areaId=" + areaId + "}";
  }

  public void process() {
    Area area = DirectoryAreas.findAreaById(areaId);
    int i = areaId.equals("ROOT") ? 3 : 1;
    jsonTree = area.toJson(i);
  }
}
