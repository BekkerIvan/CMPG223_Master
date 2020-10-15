using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
/*using GoogleApi.Entities.Common;
using GoogleApi.Entities.Maps.Geocoding;
using GoogleApi.Entities.Maps.Geocoding.Address.Request;
using GoogleApi.Entities.Common.Enums;
using Newtonsoft.Json;*/


namespace CMPG223_Base
{
    public partial class Admin_Emergency_Situation : System.Web.UI.Page
    {
        protected double lat = -25.0;
        protected double lng = 28.0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                HttpCookie _Type = Request.Cookies["ET"];
                if (_Type != null)
                {
                    tbCoordinates.Text = "index: " + _Type["index"];
                    tbDescription.Text = "item: " + _Type["item"];
                    ddlEmergencyType.SelectedIndex = int.Parse(_Type["index"]);
                    HttpContext.Current.Response.Cookies.Remove("ET");
                    _Type.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(_Type);

                    string initializeScript = "<script type='text/javascript'>initMap();</script>";
                    this.Page.ClientScript.RegisterStartupScript(this.GetType(), "Script", initializeScript, true);
                }
            }
            else
            {
                string mainconn = ConfigurationManager.ConnectionStrings["myCnn"].ConnectionString;
                SqlConnection cnn = new SqlConnection(mainconn);
                string sql = "SELECT DISTINCT Emercency_Service_Type FROM Emergency_Services";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, cnn);
                cnn.Open();
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                ddlEmergencyType.DataSource = dt;
                ddlEmergencyType.DataTextField = "Emergency_Type";
                ddlEmergencyType.DataValueField = "Emergency_Type";
                ddlEmergencyType.DataBind();
                ddlEmergencyType.Items.Insert(0, new ListItem("---Select---", "N/A"));
                adapter.Dispose();
                cnn.Close();
            }  
        }

        protected void btnCoordinates_Click(object sender, EventArgs e)
        {
            string address;
            
            address = tbLocation.Text;
            GeoCodeTest(address);
           
        }
        public void GeoCodeTest(string address)
        {
            /*            var _request = new AddressGeocodeRequest { Address = address };
                        _request.Key = "API-KEY";
                        var _response = GoogleApi.GoogleMaps.AddressGeocode.Query(_request);
                        Json_Parsing jPars = JsonConvert.DeserializeObject<Json_Parsing>(_response.RawJson.ToString());



                        foreach (var item in jPars.results)
                        {
                            lat = item.geometry.location.lat;
                            lng = item.geometry.location.lng;
                        }
                        tbCoordinates.Text = lat.ToString() + "   :   " + lng.ToString();

                        */
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                string sDiscription = tbDescription.Text;
                DateTime dtTimeStamp = new DateTime();
                dtTimeStamp = DateTime.Now;
                int iEmployee_ID;
                string sEmergencyType;

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
                string sEmergencyPersonnel_ID = lbPersonnel.SelectedItem.Text;
                sEmergencyPersonnel_ID = sEmergencyPersonnel_ID.Substring(0, sEmergencyPersonnel_ID.IndexOf('-') - 2);
                int.TryParse(sEmergencyPersonnel_ID, out int iEmergencyPersonnel_ID);

                string mainconn = ConfigurationManager.ConnectionStrings["myCnn"].ConnectionString;
                SqlConnection cnn = new SqlConnection(mainconn);
                SqlDataAdapter adapter = new SqlDataAdapter();
                string sql = "INSERT INTO Emergency_Situation ([Description], [Emergency_Situation_DateTime], [Employee_ID], [Emergency_Personnel_ID], [Emergency_Type]) VALUES (@Description, @Timstamp, @EmployeeID, @EPID, @EType)";
                SqlCommand command = new SqlCommand(sql, cnn);
                command.Parameters.AddWithValue("@Discription", sDiscription);
                command.Parameters.AddWithValue("@Timestamp", dtTimeStamp);
                command.Parameters.AddWithValue("@EmployeeID", iEmployee_ID);
                command.Parameters.AddWithValue("@EPID", iEmployee_ID);
                command.Parameters.AddWithValue("@EType", sEmergencyType);

                adapter.InsertCommand.ExecuteNonQuery();
                command.Dispose();
                adapter.Dispose();
                cnn.Close();
            }
            catch (Exception ex)
            {
                //logException
                ClientScript.RegisterStartupScript(this.GetType(), "myAlert", "Alert ('" + ex + "');", true);
                
            }

        }

        protected void ddlEmergencyType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["myCnn"].ConnectionString;
            SqlConnection cnn = new SqlConnection(mainconn);
            string sql = "SELECT [Emercency_Service_ID], [Emercency_Service_ContactDetails] FROM Emergency_Services WHERE [Emercency_Service_Type] LIKE " + ddlEmergencyType.SelectedItem.Text;
            SqlDataAdapter adapter = new SqlDataAdapter(sql, cnn);
            cnn.Open();
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            lbPersonnel.DataSource = dt;
            lbPersonnel.DataTextField = "Emercency_Service_ID" + "  -  " + "Emercency_Service_ContactDetails";
            lbPersonnel.DataValueField = "Emercency_Service_ID" + "  -  " + "Emercency_Service_ContactDetails";
            lbPersonnel.DataBind();
            adapter.Dispose();
            cnn.Close();

            Session["E_Type"] = ddlEmergencyType.SelectedIndex;
            HttpCookie _Type = new HttpCookie("ET");
            _Type["index"] = ddlEmergencyType.SelectedIndex.ToString();
            _Type["item"] = ddlEmergencyType.SelectedItem.Text;
            Response.Cookies.Add(_Type);
        }
    }
}