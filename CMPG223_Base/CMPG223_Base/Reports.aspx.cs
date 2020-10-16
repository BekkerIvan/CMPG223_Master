using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMPG223_Base
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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