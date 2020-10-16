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

        private void ExportGridToExcel(string reportName)//add parameter report name
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
            ExportGridToExcel();
            string sqlQuery = "SELECT * FROM EMERGENCY_SERVICE";
            //extractReport(sqlQuery);
        }

        


    }

}