package baseNoStates.requests;

import org.json.JSONObject;

import java.text.ParseException;

public interface Request {
  JSONObject answerToJson();

  String toString();

  void process();
}
