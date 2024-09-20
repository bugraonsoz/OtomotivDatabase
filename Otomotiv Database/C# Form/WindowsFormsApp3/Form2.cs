using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp3
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'orderPerEmployee.order_per_employee' table. You can move, or remove it, as needed.
            this.order_per_employeeTableAdapter.Fill(this.orderPerEmployee.order_per_employee);
            // TODO: This line of code loads data into the 'otomotivDataSet.Customers' table. You can move, or remove it, as needed.
            this.customersTableAdapter.Fill(this.otomotivDataSet.Customers);
            // TODO: This line of code loads data into the 'otomotivDataSet.Employees' table. You can move, or remove it, as needed.
            this.employeesTableAdapter.Fill(this.otomotivDataSet.Employees);
            // TODO: This line of code loads data into the 'otomotivDataSet.Orders' table. You can move, or remove it, as needed.
            this.ordersTableAdapter.Fill(this.otomotivDataSet.Orders);
            // TODO: This line of code loads data into the 'otomotivDataSet.Vehicles' table. You can move, or remove it, as needed.
            this.vehiclesTableAdapter.Fill(this.otomotivDataSet.Vehicles);
            // TODO: This line of code loads data into the 'otomotivDataSet.OrderDetails' table. You can move, or remove it, as needed.
            this.orderDetailsTableAdapter.Fill(this.otomotivDataSet.OrderDetails);
            // TODO: This line of code loads data into the 'otomotivDataSet.Suppliers' table. You can move, or remove it, as needed.
            this.suppliersTableAdapter.Fill(this.otomotivDataSet.Suppliers);
        }

        private void Form2_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }


        private void kapat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=DESKTOP-TC3KKGK\\SQLEXPRESS;Initial Catalog=Otomotiv;Integrated Security=True";
            
            SqlCommand command = new SqlCommand();
            command.Connection = conn;
            command.CommandText = textBox1.Text;
            command.CommandType = CommandType.Text;
            try
            {
                conn.Open();
                SqlDataReader dr = command.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                dataGridView4.DataSource = dt;
                conn.Close();
                tabControl1.SelectedTab = tabPage4;
            }
            catch (Exception)
            {
                label1.Text = "Sorguda hata var";
            }
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            sorgubilgi.Hide();
        }

        private void sorgubilgi_Click(object sender, EventArgs e)
        {
            sorgubilgi.Hide();
        }
    }
}
