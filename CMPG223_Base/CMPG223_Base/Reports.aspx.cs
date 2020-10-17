using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using System.Text;

namespace CMPG223_Base
{
    public partial class Reports : System.Web.UI.Page
    {
        private string mainconn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //string sqlQuery = "SELECT * FROM EMPLOYEE, EMPLOYEE_LOG WHERE EMPLOYEE.EMPLOYEE_ID = EMPLOYEE_LOG.EMPLOYEE_ID AND EMPLOYEE.EMPLOYEE_FIRSTNAME = '" + @firstName + "' AND EMPLOYEE.EMPLOYEE_LASTNAME = '" + @lastName + "' EMPLOYEE_LOG.DATE >= '" + @beginDate + "' AND EMPLOYEE_LOG.DATE <= '" + @endDate + "';";
            if (!IsPostBack)
            {
                string sqlQuery = "SELECT * FROM EMERGENCY_SERVICE";
                Bindgrid(sqlQuery);
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the run time error "  
            //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
        }

        private void Bindgrid( string sqlQuery)
        {
            SqlConnection cnn = new SqlConnection(mainconn); 
            SqlCommand command = new SqlCommand(sqlQuery, cnn);
            cnn.Open();
            SqlDataReader dr = command.ExecuteReader();
            grvOutput.DataSource = dr;
            grvOutput.DataBind();
            cnn.Close();

        }

        private void ExportGridToExcel(string reportName)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = reportName + DateTime.Now + ".xlsx";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            grvOutput.GridLines = GridLines.Both;
            grvOutput.HeaderStyle.Font.Bold = true;
            grvOutput.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }

        

        protected void btnExtract_Click(object sender, EventArgs e)
        {
            if (rblReports.SelectedIndex >= 0)
            {
                ExportGridToExcel("progress Report");
            }
        }

        protected void btnProvinceReport_Click(object sender, EventArgs e)
        {
            string sqlQuery = "SELECT * FROM EMERGENCY_SERVICE";
            DateTime beginDate = DateTime.Now;
            DateTime endDate = DateTime.Now;
            if (rblReports.SelectedIndex == 0)
            {
                drlFName.Enabled = false;
                
                string PROV = getProv();
                beginDate = StartCalendar.SelectedDate;
                endDate = EndCalendar.SelectedDate;
                if (PROV != "")
                    sqlQuery = "SELECT * FROM Emergency_Situation WHERE PROVINCE ='" + @PROV + "' AND EMERGENCY_SITUATION_DATETIME >= '" + @beginDate + "' AND EMERGENCY_SITUATION_DATETIME <= '" + @endDate + "';";
                else
                    sqlQuery = "SELECT * FROM Emergency_Situation WHERE EMERGENCY_SITUATION_DATETIME >= '" + @beginDate + "' AND EMERGENCY_SITUATION_DATETIME <= '" + @endDate + "';";

               
                
                

            }
                
            if (rblReports.SelectedIndex == 1)
            {
                beginDate = StartCalendar.SelectedDate;
                endDate = EndCalendar.SelectedDate;
                sqlQuery = "SELECT * FROM Emergency_Situation WHERE EMERGENCY_SITUATION_DATETIME >= '" + @beginDate + "' AND EMERGENCY_SITUATION_DATETIME <= '" + @endDate + "';";
            }
                
            if (rblReports.SelectedIndex == 2)
                sqlQuery = "SELECT* FROM EMPLOYEE WHERE USERROLE = 3";
            //SELECT A.LOG_DATE, A.LOG_IN_TIME, A.LOG_OUT_TIME, B.EMPLOYEE_ID FROM EMPLOYEE_LOG as A INNER JOIN
            //EMPLOYEE AS B ON A.EMPLOYEE_ID = B.EMPLOYEE_ID
            Bindgrid(sqlQuery);
        }
        private string getProv()
        {
            string province = "";
            if (cbEasternCape.Checked)
                province = cbEasternCape.Text;
            if (cbFreestate.Checked)
                province = cbFreestate.Text;
            if (cbGauteng.Checked)
                province = cbGauteng.Text;
            if (cbKwaZuluNatal.Checked)
                province = cbKwaZuluNatal.Text;
            if (cbLimpopo.Checked)
                province = cbLimpopo.Text;
            if (cbMpumalanga.Checked)
                province = cbMpumalanga.Text;
            if (cbNorthernCape.Checked)
                province = cbNorthernCape.Text;
            if (cbNorthWest.Checked)
                province = cbNorthWest.Text;
            if (cbWesternCape.Checked)
                province = cbWesternCape.Text;
            return province;
        }
    }

}