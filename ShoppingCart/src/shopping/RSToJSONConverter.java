package shopping;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
public class RSToJSONConverter {
	public static JSONObject convert(ResultSet rs){
		
		JSONObject json = new JSONObject();
		try {
			while(rs.next()){
				ResultSetMetaData rsmd = rs.getMetaData();
				int colNum = rsmd.getColumnCount();
//				keys.add(rs.getString("productId"));
				JSONObject obj = new JSONObject();
				for (int i=1; i<colNum+1; i++) {
			        String column_name = rsmd.getColumnName(i);
			        if(rsmd.getColumnType(i)==java.sql.Types.INTEGER){
			            obj.put(column_name, rs.getInt(column_name));
			        	}
			        else if(rsmd.getColumnType(i)==java.sql.Types.VARCHAR){
			            obj.put(column_name, rs.getString(column_name));
			           }
			        else if(rsmd.getColumnType(i)==java.sql.Types.DOUBLE){
			            obj.put(column_name, rs.getDouble(column_name)); 
			           }
				}
				json.put(rs.getString("productId"),obj);
			}
//			for(int i=0;i<keys.size();i++){
//				json2.put(keys.get(i), json.get(i));
//			}
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return json;
	}
}
