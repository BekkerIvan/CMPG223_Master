using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Configuration;

namespace CMPG_223_Test
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        //SqlConnection con = new SqlConnection(@"C:\USERS\LAZYESPRESSO\DOCUMENTS\CMPG 223\CMPG 223 TEST\CMPG 223 TEST\DATABASE1.MDF");  
        //SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;User Instance=True");
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;

        private void tableBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.tableBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.dataSet1);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dataSet1.Table' table. You can move, or remove it, as needed.
            this.tableTableAdapter.Fill(this.dataSet1.Table);

        }


        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            //SqlCommand cmd = new SqlCommand("sp_insert", con);
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@Service_ContactDetails", txtDetails.Text);
            //cmd.Parameters.AddWithValue("@Location_Lat", txtLat.Text);
            //cmd.Parameters.AddWithValue("@Location_Long", txtLong.Text);
            //cmd.Parameters.AddWithValue("@Service_Type", txtType.Text);
            //cmd.Parameters.AddWithValue("@Service_Archive", txtArchive.Text);
            //con.Open();
            //int i = cmd.ExecuteNonQuery();

            //con.Close();

            //if (i != 0)
            //{
            //    MessageBox.Show(i + "Data Saved");
            //}

            //try{
            //con.Open();
            //String ticketno=txtDetails.Text.ToString();  
            //String ticketno=txtLat.Text.ToString();
            //String ticketno=txtLong.Text.ToString();
            //String ticketno=txtType.Text.ToString();
            //String ticketno=txtArchive.Text.ToString();
            //String query = "INSERT INTO Table (Service_ID, Service_ContactDetails, Location_Lat, Location_Long, Service_Type, Service_Archive)";
            //}catch{
            //
            //}
            try
            {
                cmd = new SqlCommand("insert into student values(@a,@b,@c,@d)", con);
                cmd.Parameters.AddWithValue("@Service_ID", int.Parse(txtServiceID.Text));
                cmd.Parameters.AddWithValue("@Service_ContactDetails", txtDetails.Text);                
                cmd.Parameters.AddWithValue("@Location_Lat", int.Parse(txtLat.Text));
                cmd.Parameters.AddWithValue("@Location_Long", int.Parse(txtLong.Text));
                cmd.Parameters.AddWithValue("@Service_Type", txtType.Text);
                cmd.Parameters.AddWithValue("@Service_Archive", txtArchive.Text);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    MessageBox.Show("Data Submited");
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                con.Close();
            }
        }
    }
}
