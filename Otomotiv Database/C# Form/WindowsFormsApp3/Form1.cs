using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Data.SqlClient;

namespace WindowsFormsApp3
{
    public partial class Form1 : Form
    {
        SqlConnection conn;
        SqlDataReader reader;
        SqlCommand com;
        public Form1()
        {
            InitializeComponent();
            sifregizle();
        }
        private void sifregizle()
        {
            sifre.Text = "";
            sifre.PasswordChar = '*';
            sifre.MaxLength = 5;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            string user = kullad.Text;
            string password = sifre.Text;
            conn = new SqlConnection("Data Source=DESKTOP-TC3KKGK\\SQLEXPRESS;Initial Catalog=Otomotiv;Integrated Security=True");
            com = new SqlCommand();
            conn.Open();
            com.Connection = conn;
            com.CommandText="select * from User_Info where kullanici_adi='"+kullad.Text+"'and sifre='" + sifre.Text+"'"; 
            reader= com.ExecuteReader();
            if (reader.Read())
            {
                Form2 form2 = new Form2();
                this.Hide();
                form2.ShowDialog();
            }
            else
            {
                MessageBox.Show("Hatalı Kullanıcı Adı veya Şifre Girdiniz.\nLütfen Tekrar Deneyiniz.");
            }
        }
    }
}
