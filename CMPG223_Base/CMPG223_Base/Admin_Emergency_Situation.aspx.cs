using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using GoogleApi.Entities.Common;
using GoogleApi.Entities.Maps.Geocoding;
using GoogleApi.Entities.Maps.Geocoding.Address.Request;
using GoogleApi.Entities.Common.Enums;
using Newtonsoft.Json;


namespace CMPG223_Base
{
    public partial class Admin_Emergency_Situation : System.Web.UI.Page
    {
        protected double lat = -25.00000;
        protected double lng = 28.000000;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Session["LAT"] != null)
                    double.TryParse(Session["LAT"].ToString(), out lat);
                if (Session["LNG"] != null)
                    double.TryParse(Session["LNG"].ToString(), out lng);
                string initializeScript = "<script type='text/javascript'>initMap();</script>";
                this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", initializeScript, true);
            }
            else
            {
                string mainconn = ConfigurationManager.ConnectionStrings["myCnn"].ConnectionString;
                SqlConnection cnn = new SqlConnection(mainconn);
                string sql = "SELECT DISTINCT [EMERGENCY_SERVICE_TYPE], [EMERGENCY_SERVICE_ID] FROM EMERGENCY_SERVICE";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, cnn);
                cnn.Open();
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                ddlEmergencyType.DataSource = dt;
                ddlEmergencyType.DataTextField = "EMERGENCY_SERVICE_TYPE";
                ddlEmergencyType.DataValueField = "EMERGENCY_SERVICE_ID";       //change to only type
                ddlEmergencyType.DataBind();
                ddlEmergencyType.Items.Insert(0, new ListItem("---Select---", "N/A"));
                ddlEmergencyType.Items.Insert(1, new ListItem("All"));
                adapter.Dispose();
                cnn.Close();

                // Only for testing purposes  session info to come from login
                Session["E_ID"] = 1;
            }  
        }

        protected void btnCoordinates_Click(object sender, EventArgs e)
        {
            string address;
            
            address = tbLocation.Text;
            GeoCodeTest(address);

            string initializeScript = "<script type='text/javascript'>initMap();</script>";
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", initializeScript, true);
        }
        public void GeoCodeTest(string address)
        {
            var _request = new AddressGeocodeRequest { Address = address };
            _request.Key = "API-KEY";
            var _response = GoogleApi.GoogleMaps.AddressGeocode.Query(_request);
            Json_Parsing jPars = JsonConvert.DeserializeObject<Json_Parsing>(_response.RawJson.ToString());

            
            
            foreach (Result item in jPars.results)
            {
                lat = item.geometry.location.lat;       
                lng = item.geometry.location.lng;
            }
            tbCoordinates.Text = lat.ToString() + "   :   " + lng.ToString();
            Session["LAT"] = lat;
            Session["LNG"] = lng;
            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                string sDiscription = tbDescription.Text;
                DateTime dtTimeStamp = new DateTime();
                dtTimeStamp = DateTime.Now;
                int iEmployee_ID = 0;
                string sEmergencyType = "";
                int iEmergencyPersonnel_ID = 0;
                int iE_Sit_ID = 0;
                int iLocation_ID = 0;
                int.TryParse(lbPersonnel.SelectedValue, out int iE_Service_ID);

                if (tbCoordinates.Text == "")
                {
                    btnCoordinates.Click += BtnCoordinates_Click; 
                }
                if (Session["E_ID"] != null)
                {
                    int.TryParse(Session["E_ID"].ToString(), out iEmployee_ID);
                }
                else { throw new HttpException("No user ID found. Please contact systm adminastrator."); }
                if (Session["E_Type"] != null)
                {
                    sEmergencyType = Session["E_Type"].ToString();
                }
                else { throw new HttpException("No Emergency type found. Please select an emergency type and submit again. If the problem presist, please contact systm adminastrator."); }
                
                if (lbPersonnel.SelectedIndex >= 0)
                {
                    string sEmergencyPersonnel_ID = lbPersonnel.SelectedItem.Text;
                    int.TryParse(sEmergencyPersonnel_ID, out iEmergencyPersonnel_ID);
                }



                string mainconn = ConfigurationManager.ConnectionStrings["myCnn"].ConnectionString;
                SqlConnection cnn = new SqlConnection(mainconn);
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlDataReader reader;
                string sql = "INSERT INTO EMERGENCY_SITUATION ([DESCRIPTION], [EMERGENCY_SITUATION_DATETIME], [EMPLOYEE_ID], [EMERGENCY_SITUATION_TYPE_ID]) VALUES (@Description, @Timestamp, @EmployeeID, @EType)";
                SqlCommand command = new SqlCommand(sql, cnn);

                cnn.Open();
                command.Parameters.AddWithValue("@Description", sDiscription);
                command.Parameters.AddWithValue("@Timestamp", dtTimeStamp);
                command.Parameters.AddWithValue("@EmployeeID", iEmployee_ID);
                command.Parameters.AddWithValue("@EType", sEmergencyType);

                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();
                command.Dispose();
                adapter.Dispose();
                cnn.Close();

                sql = "SELECT MAX([EMERGENCY_SITUATION_ID]) FROM EMERGENCY_SITUATION";
                command = new SqlCommand(sql, cnn);
                cnn.Open();
                reader = command.ExecuteReader();
                while (reader.Read())
                    int.TryParse(reader.GetValue(0).ToString(), out iE_Sit_ID);
                cnn.Close();
                command.Dispose();
                reader.Close();

                sql = "INSERT INTO LOCATION ([LOCATION_LATITUDE], [LOCATION_LONGITUDE]) VALUES (@lat, @lng)";
                adapter = new SqlDataAdapter();
                command = new SqlCommand(sql, cnn);
                cnn.Open();
                command.Parameters.AddWithValue("@lat", lat);
                command.Parameters.AddWithValue("@lng", lng);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();
                command.Dispose();
                adapter.Dispose();
                cnn.Close();

                sql = "SELECT MAX([LOCATION_ID]) FROM LOCATION";
                command = new SqlCommand(sql, cnn);
                cnn.Open();
                reader = command.ExecuteReader();
                while (reader.Read())
                    int.TryParse(reader.GetValue(0).ToString(), out iLocation_ID);
                cnn.Close();
                command.Dispose();
                reader.Close();

                sql = "INSERT INTO [LOCATION_SITUATION_LINK] ([LOCATION_ID], [EMERGENCY_SITUATION_ID]) VALUEs (@locationID, @situationID)";
                adapter = new SqlDataAdapter();
                command = new SqlCommand(sql, cnn);
                cnn.Open();
                command.Parameters.AddWithValue("@locationID", iLocation_ID);
                command.Parameters.AddWithValue(" @situationID", iE_Sit_ID);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();
                command.Dispose();
                adapter.Dispose();
                cnn.Close();

                sql = "INSERT INTO [SERVICE_SITUATION_LINK] ([EMERGENCY_SITUATION_ID], [EMERGENCY_SERVICE_ID]) VALUES (@situationID, @serviceID)";
                adapter = new SqlDataAdapter();
                command = new SqlCommand(sql, cnn);
                cnn.Open();
                command.Parameters.AddWithValue("@situationID", iE_Sit_ID);
                command.Parameters.AddWithValue("@serviceID", iE_Service_ID);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();
                command.Dispose();
                adapter.Dispose();
                cnn.Close();


                lblFeedback.Text = "Emergency situation was successfully created./nTo add another service or service type simply select a new value and click on submit again." +
                    "/nTo create new emergency situation click on the 'Create new emergency situation' button.";
                lblFeedback.Visible = true;
                btnClear.Visible = true;
            }
            catch (Exception ex)
            {
                lblFeedback.Text = "" + ex;
                lblFeedback.Visible = true;
            }

        }

        private void BtnCoordinates_Click(object sender, EventArgs e)
        {
            throw new NotImplementedException();
        }

        protected void ddlEmergencyType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["myCnn"].ConnectionString;
            SqlConnection cnn = new SqlConnection(mainconn);
            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql;
            if (ddlEmergencyType.SelectedItem.Text == "All")
            {
                sql = "SELECT [EMERGENCY_SERVICE_ID], [EMERGENCY_SERVICE_NAME] + ' - ' + [EMERGENCY_SERVICE_CONTACT] AS Service FROM [EMERGENCY_SERVICE]";
            }
            else
            { sql = "SELECT [EMERGENCY_SERVICE_ID], [EMERGENCY_SERVICE_NAME] + ' - ' + [EMERGENCY_SERVICE_CONTACT] AS Service FROM [EMERGENCY_SERVICE] WHERE [EMERGENCY_SERVICE_TYPE] LIKE '%" + ddlEmergencyType.SelectedItem.Text + "%'"; }
            cnn.Open();
            
            SqlCommand command = new SqlCommand(sql, cnn);

            DataTable dt = new DataTable();
            adapter.SelectCommand = command;
            adapter.Fill(dt);
            lbPersonnel.DataSource = dt;
            lbPersonnel.DataTextField = "Service";
            lbPersonnel.DataValueField = "EMERGENCY_SERVICE_ID";
            lbPersonnel.DataBind();

            command.Dispose();
            adapter.Dispose();
            cnn.Close();

            Session["E_Type"] = ddlEmergencyType.SelectedIndex;
            HttpCookie _Type = new HttpCookie("ET");
            _Type["index"] = ddlEmergencyType.SelectedIndex.ToString();
            _Type["item"] = ddlEmergencyType.SelectedItem.Text;
            Response.Cookies.Add(_Type);
        }

        protected void btnAddEService_Click(object sender, EventArgs e)
        {
            //Add service to current situation ID
        }
    }
}           //Navigation buttons?