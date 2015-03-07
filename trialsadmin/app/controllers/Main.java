package controllers;

import play.mvc.Controller;
import play.mvc.Result;
import play.libs.Json;
import com.fasterxml.jackson.databind.JsonNode;
import play.libs.WS;
import play.libs.WS.WSRequestHolder;

import java.net.URLEncoder;
import java.io.UnsupportedEncodingException;

public class Main extends Controller {

  public static etc.IConfig config;

  private static void setCacheHeaders() {
    response().setHeader(CACHE_CONTROL, "no-store");
    response().setHeader(PRAGMA, "no-cache");
  };

  public static Result main() {
    setCacheHeaders();

    config = new etc.JsonConfig();
    JsonNode appData = config.getAppData();

    return ok(views.html.main.render(
      config.getAppId(),
      getRedirectURL(appData),
      getLogoutURL(appData),
      config.getDatavizUrl(),
      config.getAccountsUrl(),
      getYourAccountURL(appData),
      config.getApiUrl(),
      config.getInvitationParticipantAcceptUrl(),
      config.getInvitationAdminAcceptUrl()
    ));

  };

  public static String getRedirectURL(JsonNode appData) {
    try {
      return config.getAccountsUrl() + "/authorize?" +
        "client_id=" + appData.get("id").asText() +
        "&response_type=code" +
        "&redirect_uri=" + URLEncoder.encode(appData.get("redirectUri").asText(), "UTF-8");
    } catch (UnsupportedEncodingException e) {
      throw new RuntimeException(e);
    }
  }

  public static String getYourAccountURL(JsonNode appData) {
    try {
      return config.getAccountsUrl() +
        "/profile?" +
        "redirect_uri=" + URLEncoder.encode(appData.get("redirectUri").asText(), "UTF-8") +
        "&client_id=" + appData.get("id").asText();
    } catch (UnsupportedEncodingException e) {
      throw new RuntimeException(e);
    }

  }

  private static String getLogoutURL(JsonNode appData) {
    try {
      return config.getAccountsUrl() +
        "/logout?" +
        "redirect_uri=" + URLEncoder.encode(appData.get("redirectUri").asText(), "UTF-8");
    } catch (UnsupportedEncodingException e) {
      throw new RuntimeException(e);
    }
  }

  public static Result authorize() {
    setCacheHeaders();
    JsonNode appData = config.getAppData();
    String url = config.getAccountsUrl() + "/token";
    String code = request().getQueryString("code");

    WSRequestHolder request = WS.url(url);
    request.setQueryParameter("grant_type", "authorization_code");
    request.setQueryParameter("code", code);
    request.setQueryParameter("redirect_uri", appData.get("redirectUri").asText());
    request.setQueryParameter("client_id", appData.get("id").asText());
    request.setQueryParameter("client_secret", appData.get("clientSecret").asText());

    String responseJson = request.post((String) null).get().getBody();
    JsonNode response = Json.parse(responseJson);

    JsonNode tokenNode = response.get("access_token");

    if (tokenNode == null) {
      return ok(views.html.authorize.render(null));
    } else {
      return ok(views.html.authorize.render(tokenNode.asText()));
    }

  }

}
