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
            string sqlQuery = "SELECT * FROM EMPLOYEE, EMPLOYEE_LOG WHERE EMPLOYEE.EMPLOYEE_ID = EMPLOYEE_LOG.EMPLOYEE_ID AND EMPLOYEE.EMPLOYEE_FIRSTNAME = '" + @firstName + "' AND EMPLOYEE.EMPLOYEE_LASTNAME = '" + @lastName + "' EMPLOYEE_LOG.DATE >= '" + @beginDate + "' AND EMPLOYEE_LOG.DATE <= '" + @endDate + "';";
            extractReport(sqlQuery);
        }

        private void extractReport(string sql)
        {
            try
            {
                SqlConnection cnn = new SqlConnection(mainconn);
                string temp;
                
                SqlCommand command = new SqlCommand(sql, cnn);
                SqlDataReader reader = command.ExecuteReader();
                StreamWriter outputFile;
                outputFile = File.CreateText("Report.csv");
                while (reader.Read())
                {
                    temp = reader.NextResult().ToString() + ",";
                    outputFile.WriteLine(temp);

                }
                outputFile.Close();
            }
            catch (Exception ex)
            { }
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

        /*private void btnTemplate_Click(object sender, EventArgs e)
        {
            StreamWriter outputFile;
            saveFileDialog1.FileName = "Entry Form.csv";
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                outputFile = File.CreateText(saveFileDialog1.FileName);
                try
                {
                    outputFile.WriteLine("Name;Surname;Dicipline;Date of Birth(yyyy/mm/dd);Level;Club");
                    outputFile.Close();
                }
                catch (Exception ex) { MessageBox.Show(ex.Message, "Unable to create file.", MessageBoxButtons.OK, MessageBoxIcon.Error); }
            }
            else { MessageBox.Show("Tempalte was not saved.", "Operation canceled.", MessageBoxButtons.OK, MessageBoxIcon.Information); }
        }*/

        
    }

}