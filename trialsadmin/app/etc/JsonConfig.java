package etc;

import play.libs.Json;
import play.libs.WS;
import com.fasterxml.jackson.databind.JsonNode;
import java.util.Map;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;

public class JsonConfig implements IConfig {

	public static final String SAMI_CONFIG_DEFAULT_PATH = "conf/config.json";
	public static final String SAMI_CONFIG_APPLICATION_ID = "/SAMI/config/trials-admin/application.id";
	public static final String SAMI_CONFIG_APPLICATION_NAME = "/SAMI/config/trials-admin/application.name";
	public static final String SAMI_CONFIG_APPLICATION_DESCRIPTION = "/SAMI/config/trials-admin/application.description";
	public static final String SAMI_CONFIG_CLIENT_SECRET = "/SAMI/config/trials-admin/client.secret";
	public static final String SAMI_CONFIG_REDIRECT_URI = "/SAMI/config/trials-admin/redirect.uri";
    public static final String SAMI_CONFIG_ACCOUNTS_URL = "/SAMI/config/accounts/url";
    public static final String SAMI_CONFIG_API_URL = "/SAMI/config/api/url";
    public static final String SAMI_CONFIG_DATAVIZ_URL = "/SAMI/config/dataviz/url";
    public static final String SAMI_CONFIG_INVITATION_PARTICIPANT_ACCEPT_URL = "/SAMI/config/trials-admin/invitationParticipantAcceptUrl";
    public static final String SAMI_CONFIG_INVITATION_ADMIN_ACCEPT_URL = "/SAMI/config/trials-admin/invitationAdminAcceptUrl";
	public JsonNode jsonConfiguration = null;

	public JsonConfig() {
		loadJsonConfiguration();
	}

	public String getAppId() {
		return getConfigurationString(SAMI_CONFIG_APPLICATION_ID);
	}

	public JsonNode getAppData() {

		StringBuilder sb = new StringBuilder();
		sb.append("{");
		sb.append("\"id\": \"" + getAppId() + "\",");
		sb.append("\"clientSecret\": \"" + getClientSecret() + "\",");
		sb.append("\"appName\": \"" + getAppName() + "\",");
		sb.append("\"description\": \"" + getAppDescription() + "\",");
		sb.append("\"redirectUri\": \"" + getRedirectUri() + "\"");
		sb.append("}");

		return Json.parse(sb.toString());
	}

	public String getAccountsUrl() {
		return getConfigurationString(SAMI_CONFIG_ACCOUNTS_URL);
	}

	public String getApiUrl() {
		return getConfigurationString(SAMI_CONFIG_API_URL);
	}

	public String getDatavizUrl() {
		return getConfigurationString(SAMI_CONFIG_DATAVIZ_URL);
	}

	public String getInvitationParticipantAcceptUrl() {
		return getConfigurationString(SAMI_CONFIG_INVITATION_PARTICIPANT_ACCEPT_URL);
	}

	public String getInvitationAdminAcceptUrl() {
		return getConfigurationString(SAMI_CONFIG_INVITATION_ADMIN_ACCEPT_URL);
	}

	private String getClientSecret() {
		return getConfigurationString(SAMI_CONFIG_CLIENT_SECRET);
	}

	private String getAppName() {
		return getConfigurationString(SAMI_CONFIG_APPLICATION_NAME);
	}

	private String getAppDescription() {
		return getConfigurationString(SAMI_CONFIG_APPLICATION_DESCRIPTION);
	}

	private String getRedirectUri() {
		return getConfigurationString(SAMI_CONFIG_REDIRECT_URI);
	}

	private void loadJsonConfiguration() {

		String jsonConfigurationPath = System.getProperty("sami.trials.config");
		if (jsonConfigurationPath == null) {
			Map<String, String> env = System.getenv();
			jsonConfigurationPath = env.get("SAMI_TRIALS_CONFIG");
		}
	    if (jsonConfigurationPath == null) {
	    	jsonConfigurationPath = SAMI_CONFIG_DEFAULT_PATH;
	    }

	    System.out.format("Reading JSON configuration: %s\n", jsonConfigurationPath);
	    try {

			BufferedReader reader = new BufferedReader(new FileReader(jsonConfigurationPath));
			String line;
			StringBuilder stringBuilder = new StringBuilder();

			while ((line = reader.readLine()) != null) {
				stringBuilder.append(line);
			}

			jsonConfiguration = Json.parse(stringBuilder.toString());

	    } catch (IOException e) {
			e.printStackTrace();
	    }

	}

	private String getConfigurationString(String key) {

		JsonNode jsonNode = jsonConfiguration.get(key);
		return (jsonNode != null) ? jsonNode.asText() : null;

	}

	
}