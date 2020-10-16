using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CMPG223_Base
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnProvinceReport_Click(object sender, EventArgs e)
        {
            //variables for reports
            string provGP, provLP, provMP, provNW, provKZN, provFS, provEC, provWC, provNC;
            string firstName, lastName;
            DateTime beginDate, endDate;
            string sqlQuery = "";

            //get values from form
            if (cbGauteng.Checked) { provGP = "Gauteng"; }
            if (cbLimpopo.Checked) { provLP = "Limpopo"; }
            if (cbMpumalanga.Checked) { provMP = "Mpumalanga"; }
            if (cbNorthWest.Checked) { provNW = "North West"; }
            if (cbKwaZuluNatal.Checked) { provKZN = "KwaZulu Natal"; }
            if (cbFreestate.Checked) { provFS = "Free State"; }
            if (cbEasternCape.Checked) { provEC = "Eastern Cape"; }
            if (cbWesternCape.Checked) { provWC = "Western Cape"; }
            if (cbNorthernCape.Checked) { provNW = "Northern Cape"; }

            firstName = drlFName.SelectedValue;
            lastName = drlLName.SelectedValue;

            beginDate = StartCalendar.SelectedDate;
            endDate = EndCalendar.SelectedDate;


            int i = rblReports.SelectedIndex;

            switch (i)
            {
                case 0:
                    sqlQuery = "SELECT * FROM Emergency_Situation WHERE EMERGENCY_SITUATION_DATETIME >= '" + @beginDate + "' AND EMERGENCY_SITUATION_DATETIME <= '" + @endDate + "';";
                    break;
                case 1:
                    sqlQuery = "SELECT * FROM Emergency_Situation WHERE EMERGENCY_SITUATION_DATETIME >= '"+@beginDate + "' AND EMERGENCY_SITUATION_DATETIME <= '" + @endDate + "';";
                    break;
                case 2:
                    sqlQuery = "SELECT * FROM EMPLOYEE, EMPLOYEE_LOG WHERE EMPLOYEE.EMPLOYEE_ID = EMPLOYEE_LOG.EMPLOYEE_ID AND EMPLOYEE.EMPLOYEE_FIRSTNAME = '" + @firstName + "' AND EMPLOYEE.EMPLOYEE_LASTNAME = '" + @lastName + "' EMPLOYEE_LOG.DATE >= '" + @beginDate + "' AND EMPLOYEE_LOG.DATE <= '" + @endDate + "';";
                    break;
                default:
                    break;

            }


        }

        protected void rblAction_SelectedIndexChanged1(object sender, EventArgs e)
        {
            //enable extra parameter fields

            int i = rblReports.SelectedIndex;

            switch(i)
            {
                case 0:
                    cbEasternCape.Visible = true;
                    cbFreestate.Visible = true;
                    cbGauteng.Visible = true;
                    cbKwaZuluNatal.Visible = true;
                    cbLimpopo.Visible = true;
                    cbMpumalanga.Visible = true;
                    cbNorthernCape.Visible = true;
                    cbNorthWest.Visible = true;
                    cbWesternCape.Visible = true;
                    lblFname.Visible = false;
                    drlFName.Visible = false;
                    lblLName.Visible = false;
                    drlLName.Visible = false;
                    break;
                case 1:
                    cbEasternCape.Visible = false;
                    cbFreestate.Visible = false;
                    cbGauteng.Visible = false;
                    cbKwaZuluNatal.Visible = false;
                    cbLimpopo.Visible = false;
                    cbMpumalanga.Visible = false;
                    cbNorthernCape.Visible = false;
                    cbNorthWest.Visible = false;
                    cbWesternCape.Visible = false;
                    lblFname.Visible = false;
                    drlFName.Visible = false;
                    lblLName.Visible = false;
                    drlLName.Visible = false;
                    break;
                case 2:
                    cbEasternCape.Visible = false;
                    cbFreestate.Visible = false;
                    cbGauteng.Visible = false;
                    cbKwaZuluNatal.Visible = false;
                    cbLimpopo.Visible = false;
                    cbMpumalanga.Visible = false;
                    cbNorthernCape.Visible = false;
                    cbNorthWest.Visible = false;
                    cbWesternCape.Visible = false;
                    lblFname.Visible = true;
                    drlFName.Visible = true;
                    lblLName.Visible = true;
                    drlLName.Visible = true;
                    break;
                default:
                    break;

            }
        }





        /*private void btnGetScores_Click(object sender, EventArgs e)
{
try
{
string temp = "", temp2, app = cbApp.Text;
string readSQL = @"SELECT [Competition Number] FROM Gymnast_Info WHERE [Group] LIKE '" + cbGroup.Text + "'";
string readSQL2 = @"SELECT [Competition Number] FROM [" + app + "] WHERE [Group] LIKE '" + cbGroup.Text + "'";
string insertSQL;
SqlCommand readCommand = new SqlCommand(readSQL, cnn);
SqlCommand readCommand2 = new SqlCommand(readSQL2, cnn);
SqlCommand insertCommand;
SqlDataReader reader = readCommand.ExecuteReader();
SqlDataReader reader2 = readCommand2.ExecuteReader();
adapter = new SqlDataAdapter();
while (reader.Read())
{
  temp = reader.GetValue(0).ToString();
  while (reader2.Read())
  {
      temp2 = reader2.GetValue(0).ToString();
      if (temp2 != temp)
      {
          insertSQL = @"INSERT INTO [" + app + "] ([Competition Number], [Group], [Dicipline]) VALUES('" + temp + "', '" + cbGroup.Text + "', '" + cbDicipline.Text + "')";
          insertCommand = new SqlCommand(insertSQL, cnn);
          adapter.InsertCommand = new SqlCommand(insertSQL, cnn);
          adapter.InsertCommand.ExecuteNonQuery();
          insertCommand.Dispose();
      }
      else { break; }
  }

}
readCommand.Dispose();
adapter.Dispose();

adapter = new SqlDataAdapter("SELECT [Group], [Competition Number], [D1], [D2], [E1], [E2], [E3], [E4], [Starting Value] " + "FROM [" + cbApp.Text + "] WHERE [Group] LIKE'" + cbGroup.Text + "'", cnn);
ds = new System.Data.DataSet();
adapter.Fill(ds, cbApp.Text);
dataGridView1.DataSource = ds.Tables[0];
adapter.Dispose();
ds.Dispose();
}
catch (Exception ex) { MessageBox.Show(ex.Message, "Unable to get score sheet", MessageBoxButtons.OK, MessageBoxIcon.Error); }
}*/
    }
}