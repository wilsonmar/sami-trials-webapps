package etc;

import com.fasterxml.jackson.databind.JsonNode;

public interface IConfig {
	
	public String getAppId();
	public JsonNode getAppData();
	public String getAccountsUrl();
	public String getApiUrl();
	public String getDatavizUrl();

}