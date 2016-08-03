using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    decimal drinkTotal, starterTotal, mainTotal, dessertTotal;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        decimal tip = (decimal.Parse(percentTB.Text) / 100) * (decimal.Parse(billTB.Text));
        tipTotal.Text = "£" + tip.ToString("#.##");

        decimal total = decimal.Parse(billTB.Text) + tip;
        toPay.Text = "£" + total.ToString("#.##");

        decimal split = total / int.Parse(peopleTB.Text);
        perPerson.Text = "£" + split.ToString("#.##");

    }

    protected void ResetButton_Click(object sender, EventArgs e)
    {
        billTB.Text = "";
        peopleTB.Text = "";
        percentTB.Text = "";
        tipTotal.Text = "";
        toPay.Text = "";
        perPerson.Text = "";
    }

    private void drawChart()
    {
        drinkTotal = (decimal.Parse(drinkTB.Text));

        starterTotal = (decimal.Parse(starterTB.Text));

        mainTotal = (decimal.Parse(mainTB.Text));

        dessertTotal = (decimal.Parse(dessertTB.Text));

        ClientScript.RegisterStartupScript(GetType(), "draw","draw('" + drinkTotal + "','" + starterTotal + "','" + mainTotal + "','" + dessertTotal + "');", true);
    }

    protected void DrawGraph_Click(object sender, EventArgs e)
    {
        drawChart();                       
    }
}